package br.com.softsaj.gibgasbeta;

import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONException;

import java.util.ArrayList;

import Bean.ProdutoDTO;
import Bean.StoreManager;
import Util.AdapterParadas;
import Util.AdapterProdutoDTO;


public class Cart extends Fragment {

    ProdutoDTO produtoDTO;
    ArrayList<ProdutoDTO> lista_de_produtos;
    ListView produtos;
    AdapterParadas adapterProdutoDTO;
    TextView total;
    TextView subtotal;
    static String adress = "Selecionar Endereço no Mapa";

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        final TextView endereço = (TextView)  view.findViewById(R.id.textView113);
        endereço.setText(adress);
        final Button  BRetirar = (Button) getView().findViewById(R.id.button32);
        final Button BEntregar = (Button) getView().findViewById(R.id.button31);
        produtos = (ListView) getView().findViewById(R.id.hu);
        subtotal = (TextView) getView().findViewById(R.id.textView14);
        final TextView frete = (TextView) getView().findViewById(R.id.textView53);
        final TextView impostos = (TextView) getView().findViewById(R.id.textView110);
        total = (TextView) getView().findViewById(R.id.textView112);
        final Button finalizar =  (Button) getView().findViewById(R.id.button12);
        final ImageButton icon =  (ImageButton) getView().findViewById(R.id.imageButton2);

        icon.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                //Go To Payment
                GibGas.setTela("escolheendereço");
                getActivity().getSupportFragmentManager().beginTransaction().replace(R.id.container, new Maps_Principal_Fragemnt()).commit();


            }
        });

        finalizar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                //Go To Payment

            }
        });

        //Cria ação ao clicar no botão Remessa
        BRetirar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

               //Esconde Endereço
                //Aparece Pra selecionar
                endereço.setVisibility(View.INVISIBLE);
                icon.setVisibility(View.INVISIBLE);



                //Muda backgroung e foreground do botões
                //Botão fica escuro com texto branco
                BRetirar.setBackgroundResource(R.drawable.button_quadrado_escuro_revert);
                BRetirar.setTextColor(Color.parseColor("#ffffff"));
                //Outro botão fica branco com texto escuro
                BEntregar.setBackgroundResource(R.drawable.button_quadrado_borda_branco_revert);
                BEntregar.setTextColor(Color.parseColor("#333333"));
            }
        });


        //Cria ação ao clicar no botão Viagens
        BEntregar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {


                //Aparece Pra selecionar
                endereço.setVisibility(View.VISIBLE);
                icon.setVisibility(View.VISIBLE);


                //Muda backgroung e foreground do botões
                //Botão fica escuro com texto branco
                BEntregar.setBackgroundResource(R.drawable.button_quadrado_escuro);
                BEntregar.setTextColor(Color.parseColor("#ffffff"));
                //Outro botão fica branco com texto escuro
                BRetirar.setBackgroundResource(R.drawable.button_quadrado_borda_branco);
                BRetirar.setTextColor(Color.parseColor("#333333"));

            }
        });


        produtos.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView<?> adapter, View view,
                                    int posicao, long id) {
                // TODO Auto-generated method stub
                //alert("Escolheu");
                //Remessa remessa = (Remessa) adapter.getItemAtPosition(posicao);
                //ProdutoDTO produtoDTO = adapterProdutoDTO.getItem(posicao);
                //alert("Remessa idChamada: "+ produtoDTO.getIdChamada());

                //Pega quantidade
                produtoDTO.setQuantidade(1);

                //Adiciona produto ao Carrinho
                StoreManager a = new StoreManager(getActivity().getApplicationContext());
                try {
                    a.setProductOnCart(produtoDTO);
                } catch (JSONException e) {
                    e.printStackTrace();
                }


            }
        });


        Carregar_Lista();
    }




    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_cart, container, false);
    }

    public void Carregar_Lista(){

        try {

            lista_de_produtos = new StoreManager(getActivity().getApplicationContext()).getProdctOnCart();
            adapterProdutoDTO = new AdapterParadas(lista_de_produtos, getActivity());

        } catch (JSONException e) {
            e.printStackTrace();
        }

        getActivity().runOnUiThread(new Runnable() {

            @Override
            public void run(){
                produtos.setAdapter(adapterProdutoDTO);


            }
        });
        float sbtotal = 0;
        for(ProdutoDTO p: lista_de_produtos){
            sbtotal = sbtotal + p.getSubTotal();
        }
        total.setText("R$ "+sbtotal);
        subtotal.setText("R$ "+sbtotal);

    }

    public static void setAddress(String a){
        adress = a;
    }

}