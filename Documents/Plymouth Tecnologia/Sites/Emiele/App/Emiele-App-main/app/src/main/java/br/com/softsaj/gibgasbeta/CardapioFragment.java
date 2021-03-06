package br.com.softsaj.gibgasbeta;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import Bean.AuthRequestRegister;
import Bean.Produto;
import Bean.ProdutoDTO;
import Bean.Remessa;
import Bean.StoreManager;
import Util.AdapterProdutoDTO;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class CardapioFragment extends Fragment {

    ProdutoDTO produtoDTO;
    ArrayList<ProdutoDTO> lista_de_produtos;
    ListView listaView;
    AdapterProdutoDTO adapterProdutoDTO;

    ProdutoDTO produtoDTOSelected;


    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        Carregar_Lista();



        listaView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView<?> adapter, View view,
                                    int posicao, long id) {
                // TODO Auto-generated method stub
                //alert("Escolheu");
                //Remessa remessa = (Remessa) adapter.getItemAtPosition(posicao);

                produtoDTOSelected = adapterProdutoDTO.getItem(posicao);
                alertDialogDemo();

            }
        });

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_cardapio, container, false);
    }

    public void Carregar_Lista(){

        produtoDTO = new ProdutoDTO();
        lista_de_produtos = new ArrayList<ProdutoDTO>();
       // listaView = (ListView) getActivity().findViewById(R.id.listidprod);
        listaView = (ListView) getView().findViewById(R.id.listidprod);
       // listaView = (ListView) contentView().findViewById(R.id.listidprod);

        OkHttpClient client = new OkHttpClient();
        String url= "https://emiele-service-vendas.herokuapp.com/" +
                "produtos/produtodto/byvendedor?id="+1+"&token="+"12";

        Request request = new Request.Builder()
                .url(url)
                .build();


        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                //alert("Erro ao buscarprodutos!");
                call.cancel();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                final String a = response.body().string();
                //Log.i("MyApp","Response:" +a);

                try {
                    final JSONArray myResponse = new JSONArray(a);
                    Log.i("MyApp","JSonArray:"+myResponse);

                    for (int i =0; i < myResponse.length(); i++){
                        JSONObject obj = myResponse.getJSONObject(i);
                        ProdutoDTO produto = new ProdutoDTO();
                        produto.setId(obj.getLong("id"));
                        produto.setCodigo(obj.getString("codigo"));
                        produto.setPrecoun(obj.getString("precoun"));
                       // produto.setBitmap(new JSONArray(obj.getString("files")).getJSONObject(0).get("data"),0,  );
                        produto.setData(new JSONArray(obj.getString("files")).getJSONObject(0).getString("data"));
                        //Log.i("Tracee",produto.getData());
                        lista_de_produtos.add(produto);
                    }

                    //Adicinoa na listView

                    adapterProdutoDTO = new AdapterProdutoDTO(lista_de_produtos, getActivity());


                    set();

                } catch (JSONException e) {
                    Log.i("MyApp","Erro:");
                    e.printStackTrace();

                }


            }
        });


        /**
         *
         *  Type listType = new TypeToken<ArrayList<ProdutoDTO>>() {}.getType();
         *                 //lista_de_produtos = new Gson().fromJson(response.body().string(), listType);
         *                 Log.i("MyApp","List: "+lista_de_produtos.toString());
         */

    }




    public void set(){
        getActivity().runOnUiThread(new Runnable() {

            @Override
                    public void run(){
                listaView.setAdapter(adapterProdutoDTO);


            }
        });
    }

    private void alert(String msg){
        Toast.makeText(getActivity().getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
    }

    void alertDialogDemo() {
        // get alert_dialog.xml view
        LayoutInflater li = LayoutInflater.from(getActivity());
        View promptsView = li.inflate(R.layout.alert_dialog, null);

        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                getActivity());

        // set alert_dialog.xml to alertdialog builder
        alertDialogBuilder.setView(promptsView);

        final EditText userInput = (EditText) promptsView.findViewById(R.id.etUserInput);

        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                        //Toast.makeText(getActivity(), "Entered: "+userInput.getText().toString(), Toast.LENGTH_LONG).show();

                        //Pega quantidade
                        produtoDTOSelected.setQuantidade(Integer.parseInt(userInput.getText().toString()));
                        //calcula subtotal
                        float total = produtoDTOSelected.getQuantidade()*Float.parseFloat(produtoDTOSelected.getPrecoun().replace(",","."));
                        produtoDTOSelected.setSubTotal(total);


                        //Adiciona produto ao Carrinho
                        StoreManager a = new StoreManager(getActivity().getApplicationContext());
                        try {
                            a.setProductOnCart(produtoDTOSelected);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }


                    }
                })
                .setNegativeButton("Cancel",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });

        // create alert dialog
        AlertDialog alertDialog = alertDialogBuilder.create();

        // show it
        alertDialog.show();
    }
}