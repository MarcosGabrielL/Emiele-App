package br.com.softsaj.gibgasbeta;

import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.util.Log;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;

import Bean.Remetentes;
import Bean.StoreManager;
import Bean.Transportador;

public class GibGas extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener{



    public static Transportador transportador;
    public static Remetentes remetente;

    static String retorno = "Nada";
    static String Tela = "";
    String id;
    static Context context;
    public static boolean chamou;

    String tip;
    FloatingActionButton fab;
    public static TextView quantidade;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle("Emiele");
        //toolbar.setTitleTextColor(Color.parseColor("255,255,255"));
        //toolbar.set
        setSupportActionBar(toolbar);

        quantidade = (TextView) findViewById(R.id.textView54123);
        fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                fab.hide();
                quantidade.setVisibility(View.INVISIBLE);
                getSupportFragmentManager().beginTransaction()
                        .replace(R.id.container, new Cart()).commit();

            }
        });



        StoreManager a = new StoreManager(GibGas.this);
        try {

            int i = a.getCountCart();

            setQuantidade(i);

        } catch (JSONException e) {
            e.printStackTrace();
        }




        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        remetente = new Remetentes();
        transportador = new Transportador();

        chamou = false;
        context = this;
        pegaTipo();

        //Verificar notifica????es

    }



    @Override
    public void onBackPressed() {
        if (Tela.equals("")) {
            getSupportFragmentManager().beginTransaction().replace(R.id.container, new CardapioFragment()).commit();
            fab.show();
            quantidade.setVisibility(View.VISIBLE);
        }if (Tela.equals("escolheendere??o")){
            fab.hide();
            quantidade.setVisibility(View.INVISIBLE);
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, new Cart()).commit();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        //noinspection SimplifiableIfStatement
        //if (id == R.id.action_back) {
          //  alert("Notifica????es");
            //return true;
        //}

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if(id == R.id.nav_inicio){
            //Volta ao inicio
            getSupportFragmentManager().beginTransaction().replace(R.id.container, new CardapioFragment()).commit();
            fab.show();
            quantidade.setVisibility(View.VISIBLE);
        }else if (id == R.id.nav_perfil) {
            //Chama Perfil

                getSupportFragmentManager().beginTransaction().replace(R.id.container, new Perfil_remetente()).commit();

        } else if (id == R.id.nav_atividades) {
            //Chama Atividades
                getSupportFragmentManager().beginTransaction().replace(R.id.container, new Pedidos()).commit();

        } else if (id == R.id.nav_acompanhar) {
            //Chama Acompanahr
             getSupportFragmentManager().beginTransaction().replace(R.id.container, new Remessas()).commit();

        } else if (id == R.id.nav_config) {
            //Chama Configura????es
                getSupportFragmentManager().beginTransaction().replace(R.id.container, new Configucarao_fragment()).commit();

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }else if (id == R.id.nav_sair) {
            StoreManager a = new StoreManager(GibGas.this);
            a.Logout();
            finishAffinity();
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }


    private static void alert(String msg){
        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
    }


    public void pegaTipo(){

        getSupportFragmentManager().beginTransaction().replace(R.id.container, new CardapioFragment()).commit();


    }



    public static String getRetorno() {
        return retorno;
    }

    public static void setchamou(boolean c){
        chamou = c;
    }



    public static Transportador getTransportador(){
        return  transportador;
    }

    public static void setQuantidade(int q){

        if(q>=1) {
            if(q>=10) {
                quantidade.setVisibility(View.VISIBLE);
                quantidade.setText("" + q);
            }else{
                quantidade.setVisibility(View.VISIBLE);
                quantidade.setText(" " + q+" ");
            }
        }else{
            quantidade.setVisibility(View.INVISIBLE);

        }

    }

    public static void setTela(String a){
        Tela = a;
    }
}
