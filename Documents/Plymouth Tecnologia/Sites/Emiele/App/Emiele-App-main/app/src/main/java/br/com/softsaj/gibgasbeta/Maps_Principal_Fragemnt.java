package br.com.softsaj.gibgasbeta;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.content.ContextCompat;
import android.test.mock.MockPackageManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.UiSettings;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.Query;
import com.google.firebase.database.ValueEventListener;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import Bean.Local;
import Bean.Remessa;
import Dao.Connector;
import Util.GPSTracker;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnCameraIdleListener;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMapLongClickListener;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;

public class Maps_Principal_Fragemnt extends Fragment
        implements OnMapClickListener, OnMapLongClickListener, OnCameraIdleListener,
        OnMapReadyCallback{




    Local local;
    ArrayList<Local> locais;

    FirebaseDatabase database;
    DatabaseReference myRef;

    double latitude;
    double longitude;
    GoogleMap mMap;

    private static final  int REQUEST_CODE_PERMISSION = 2;
    String mPermission = android.Manifest.permission.ACCESS_FINE_LOCATION;
    GPSTracker gps;
    String value = null;

    Boolean chamou;
    String Id;
    Remessa remessaa;

    TextView endereco;

    private Button enviar;

        @Nullable
        public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
            return inflater.inflate(R.layout.activity_maps, container, false);
        }




    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        SupportMapFragment mapFragment = (SupportMapFragment) getChildFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);

        chamou = false;
        local = new Local();
        enviar = (Button) getView().findViewById(R.id.envi);
        endereco = (TextView) getView().findViewById(R.id.textView77);

        enviar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                //Escolher Destino
                Geocoder geocoder;
                List<Address> adresses;
                geocoder = new Geocoder(getActivity(), Locale.getDefault());
                String address = "";
                try {
                    adresses = geocoder.getFromLocation(Double.valueOf(local.getLatitude()), Double.valueOf(local.getLongitude()), 1);
                    address = adresses.get(0).getAddressLine(0);
                    Log.i("Tracee","Endereço: "+ address);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                GibGas.setTela("");
                Cart.setAddress(address.substring(0,25)+"...");
                getActivity().getSupportFragmentManager().beginTransaction().replace(R.id.container, new Cart()).commit();

            }
        });

        //Checa permissão
        try{
            if (ActivityCompat.checkSelfPermission(getActivity(),mPermission)!= MockPackageManager.PERMISSION_GRANTED){
                ActivityCompat.requestPermissions(getActivity(),new String[]{mPermission},REQUEST_CODE_PERMISSION);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        Id = "1";
        locais = new ArrayList<>();
        pegarLocalRemetentes();

    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {

        //Busca Lat e Long Celular
        gps = new GPSTracker(getActivity());

        mMap = googleMap;
        mMap.setOnMapClickListener(this);
        mMap.setOnMapLongClickListener(this);
        mMap.setOnCameraIdleListener(this);
        if (gps.canGetLocation()){
            latitude = gps.getLatitude();
            longitude = gps.getLongitude();
            database = FirebaseDatabase.getInstance();
            myRef = database.getReference("Location");
            myRef.setValue(latitude+","+longitude);

            if(latitude==0 && longitude==0){

                //Marca Softsaj no Mapa
                LatLng softsaj = new LatLng(-12.978148, -39.281246);
                googleMap.addMarker(new MarkerOptions().position(softsaj)
                        .title("Softsaj"));
                googleMap.moveCamera(CameraUpdateFactory.newLatLng(softsaj));
                googleMap.animateCamera(CameraUpdateFactory.zoomTo(17));

            }else {


                //Atualiza posição do Transportador a cada 30 segundos
                //Marca Pessoa no mapa

                int height = 100;
                int width = 100;
                BitmapDrawable bitmapdraw = (BitmapDrawable) getResources().getDrawable(R.drawable.marker);
                Bitmap b = bitmapdraw.getBitmap();
                final Bitmap smallMarker = Bitmap.createScaledBitmap(b, width, height, false);
                LatLng rem = new LatLng(latitude, longitude);
                mMap.addMarker(new MarkerOptions().position(rem)
                        .title("Eu").icon(BitmapDescriptorFactory.fromBitmap(smallMarker)));
                googleMap.moveCamera(CameraUpdateFactory.newLatLng(rem));
                googleMap.animateCamera(CameraUpdateFactory.zoomTo(17));
                local.setLatitude(String.valueOf(latitude));
                local.setLongitude(String.valueOf(longitude));
                local.setId(Id);
                //databaseReference.child("Local_Remetentes").child(user.getUid()).setValue(local);



            }





        }else{
            gps.showSettingsAlert();
        }

        Handler handle = new Handler();
        handle.postDelayed(new Runnable() {
            @Override
            public void run() {
                VerificaSePegaramRemessa();
            }
        }, 10000);

    }

    private void buscaTransportadores() {

        //Criz Quadrado LAT e LGN
        //Pesquisa as localizações dos transportadores
        //Se LatLong + x < Localização
        //Marca no mapa
       // alert("Aqui3");
    }


    private void alert(String msg){
        Toast.makeText(getActivity(), msg, Toast.LENGTH_SHORT).show();
    }

    public void pegarLocalRemetentes(){
        //Busca Localização dos Remetentes
        String id = Id;
        locais.clear();
        //Query
        Query query1 = FirebaseDatabase.getInstance().getReference("Local_Transportador")
                .orderByChild("id")
                .equalTo(id);
        query1.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                //Passa lista de locais dos remetentes pra lista
                for(DataSnapshot obj : dataSnapshot.getChildren()){
                    Local local = obj.getValue(Local.class);
                    locais.add(local);
                }

            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                //Se ocorrer um erro
                alert("Ocorreu um erro ao carregar informações!");
                //Query
            }
        });
    }

    private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == "K") {
            dist = dist * 1.609344;
        } else if (unit == "N") {
            dist = dist * 0.8684;
        }

        return (dist);
    }

    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    /*::    This function converts decimal degrees to radians                         :*/
    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    /*::    This function converts radians to decimal degrees                         :*/
    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

    public void VerificaSePegaramRemessa(){
        //Se usuario == TRANSPORTADOR
        //Se não ta chamando
        //alert("Verifica se tem chamada");
        //SystemClock.sleep(1000);

        if (chamou==false) {

            //Verifica se Transportador Chama == true
            Query query1 = FirebaseDatabase.getInstance().getReference("Remessa_Aguarda")
                    .orderByChild("idRemetente")
                    .equalTo(Id);
            query1.addListenerForSingleValueEvent(new ValueEventListener() {
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    //alert("Carregando os dados!");
                    for(DataSnapshot obj : dataSnapshot.getChildren()){
                        remessaa = obj.getValue(Remessa.class);

                        //Notifica
                        //Se estiver aberto
                        //Carrega Pagina de Confirmação
                        chamou=true;
                        getActivity().getSupportFragmentManager().beginTransaction().replace(R.id.container, new ConfirmaViagem()).commit();
                        ConfirmaViagem.setRemessa(remessaa);
                        //alert("Aceitaram uma remessa minha. DESTINO: "+remessaa.getEntregaCidade());
                    }
                }

                @Override
                public void onCancelled(DatabaseError databaseError) {
                    //Se ocorrer um erro
                    alert("Ocorreu um erro ao carregar informações sobre usuário!");
                }
            });

        }



            Handler handle = new Handler();
            handle.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if(chamou==false){ VerificaSePegaramRemessa2();}
                }
            }, 10000);



    }

    public void VerificaSePegaramRemessa2(){
        //Se usuario == TRANSPORTADOR
        //Se não ta chamando
        //alert("Verifica se tem chamada");
        //SystemClock.sleep(1000);

        if (chamou==false) {

            //Verifica se Transportador Chama == true
            Query query1 = FirebaseDatabase.getInstance().getReference("Remessa_Aguarda")
                    .orderByChild("idRemetente")
                    .equalTo(Id);
            query1.addListenerForSingleValueEvent(new ValueEventListener() {
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    //alert("Carregando os dados!");
                    for(DataSnapshot obj : dataSnapshot.getChildren()){
                        remessaa = obj.getValue(Remessa.class);

                        //Notifica
                        //Se estiver aberto
                        //Carrega Pagina de Confirmação
                        chamou=true;
                        getActivity().getSupportFragmentManager().beginTransaction().replace(R.id.container, new ConfirmaViagem()).commit();
                        ConfirmaViagem.setRemessa(remessaa);
                        //alert("Aceitaram uma remessa minha. DESTINO: "+remessaa.getEntregaCidade()+"VAlor: "+remessaa.getValorViagem());
                    }
                }

                @Override
                public void onCancelled(DatabaseError databaseError) {
                    //Se ocorrer um erro
                    alert("Ocorreu um erro ao carregar informações sobre usuário!");
                }
            });

        }

        Handler handle = new Handler();
        handle.postDelayed(new Runnable() {
            @Override
            public void run() {
                if(chamou==false){ VerificaSePegaramRemessa();}
            }
        }, 10000);

    }


    @Override
    public void onCameraIdle() {

        int height = 100;
        int width = 100;
        BitmapDrawable bitmapdraw = (BitmapDrawable) getResources().getDrawable(R.drawable.marker);
        Bitmap b = bitmapdraw.getBitmap();
        final Bitmap smallMarker = Bitmap.createScaledBitmap(b, width, height, false);
        LatLng rem =  new LatLng(mMap.getCameraPosition().target.latitude, mMap.getCameraPosition().target.longitude);

        mMap.clear();
        mMap.addMarker(new MarkerOptions().position(rem)
                .title("Eu").icon(BitmapDescriptorFactory.fromBitmap(smallMarker)));
        local.setLatitude(String.valueOf(mMap.getCameraPosition().target.latitude));
        local.setLongitude(String.valueOf(mMap.getCameraPosition().target.longitude));
        local.setId(Id);

        Geocoder geocoder;
        List<Address> adresses;
        geocoder = new Geocoder(getActivity(), Locale.getDefault());
        String address = "";
        try {
            adresses = geocoder.getFromLocation(Double.valueOf(local.getLatitude()), Double.valueOf(local.getLongitude()), 1);
            address = adresses.get(0).getAddressLine(0);
            endereco.setText(address);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void onMapClick(LatLng latLng) {
        int height = 100;
        int width = 100;
        BitmapDrawable bitmapdraw = (BitmapDrawable) getResources().getDrawable(R.drawable.marker);
        Bitmap b = bitmapdraw.getBitmap();
        final Bitmap smallMarker = Bitmap.createScaledBitmap(b, width, height, false);
        LatLng rem =  latLng;
        mMap.clear();
        mMap.addMarker(new MarkerOptions().position(rem)
                .title("Eu").icon(BitmapDescriptorFactory.fromBitmap(smallMarker)));
        local.setLatitude(String.valueOf(mMap.getCameraPosition().target.latitude));
        local.setLongitude(String.valueOf(mMap.getCameraPosition().target.longitude));
        local.setId(Id);

        Geocoder geocoder;
        List<Address> adresses;
        geocoder = new Geocoder(getActivity(), Locale.getDefault());
        String address = "";
        try {
            adresses = geocoder.getFromLocation(Double.valueOf(local.getLatitude()), Double.valueOf(local.getLongitude()), 1);
            address = adresses.get(0).getAddressLine(0);
            endereco.setText(address);
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void onMapLongClick(LatLng latLng) {

    }
}
