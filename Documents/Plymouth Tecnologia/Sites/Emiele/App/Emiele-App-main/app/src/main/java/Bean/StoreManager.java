package Bean;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import br.com.softsaj.gibgasbeta.GibGas;

public class StoreManager {

    private SharedPreferences.Editor editor;
    private Context _context;
    public SharedPreferences pref;
    private int PRIVATE_MODE = 0;
    private static final String PREF_NAME = "_store";



    public StoreManager(Context _context) {
        this._context = _context;
        pref = _context.getSharedPreferences(PREF_NAME, PRIVATE_MODE);
        editor = pref.edit();
    }

    public void setToken(String Token) {
        editor.putString("Token", Token);
        System.out.println("token saved" + " " + Token);
        editor.commit();
    }

    public void cleanCart(){
        editor.putString("cart", null);
        editor.commit();
    }

    public int getCountCart() throws JSONException {
        ArrayList<ProdutoDTO> lista_de_produtos = new ArrayList<ProdutoDTO>();
        String carrinhoString = pref.getString("cart", null);

            JSONArray array = new JSONArray(carrinhoString);

            return array.length();
    }

    public void setProductOnCart(ProdutoDTO p) throws JSONException {

       // Log.i("Tracee","Produto Quantidade: "+p.getQuantidade());
        ArrayList<ProdutoDTO> lista_de_produtos = new ArrayList<ProdutoDTO>();
        String carrinhoString = pref.getString("cart", null);
       // Log.i("Tracee","Lista Antiga: "+carrinhoString);
        if(carrinhoString!=null){
            JSONArray array = new JSONArray(carrinhoString);
            if(array.length()>=1) {
                for (int i = 0; i < array.length(); i++) {
                    JSONObject obj = array.getJSONObject(i);

                    ProdutoDTO produto = new ProdutoDTO();
                    produto.setCodigo(obj.getString("codigo"));
                    produto.setPrecoun(obj.getString("precoun"));
                    produto.setData(obj.getString("data"));
                    produto.setId(obj.getLong("id"));
                    produto.setSubTotal(Float.parseFloat(obj.getString("SubTotal")));
                    produto.setQuantidade(obj.getInt("quantidade"));
                    //produto.setVendedor_id(obj.getString("vendedorId"));

                    lista_de_produtos.add(produto);
                }
                boolean tem = false;
                int index = 0;
                for(ProdutoDTO pa: lista_de_produtos){
                    if(pa.getCodigo().equals(p.getCodigo())){
                        tem = true;
                        index = lista_de_produtos.indexOf(pa);
                    }
                }
                if(tem){
                    lista_de_produtos.remove(index);
                lista_de_produtos.add(p);
                }
            }


        }else {
            lista_de_produtos.add(p);
        }

        editor.putString("cart", new Gson().toJson(lista_de_produtos));
        editor.commit();

        GibGas.setQuantidade(lista_de_produtos.size());
        //Log.i("Tracee","Lista: "+new Gson().toJson(lista_de_produtos));
        //Log.i("Tracee","Produto Nova Quantidade: "+lista_de_produtos.get(0).getQuantidade());
    }

    public ArrayList<ProdutoDTO> getProdctOnCart() throws JSONException {
        ArrayList<ProdutoDTO> lista_de_produtos = new ArrayList<ProdutoDTO>();
        String carrinhoString = pref.getString("cart", null);

        if(carrinhoString!=null) {
            JSONArray array = new JSONArray(carrinhoString);
            if (array.length() >= 1) {
                for (int i = 0; i < array.length(); i++) {
                    JSONObject obj = array.getJSONObject(i);

                    ProdutoDTO produto = new ProdutoDTO();
                    produto.setCodigo(obj.getString("codigo"));
                    produto.setPrecoun(obj.getString("precoun"));
                    produto.setData(obj.getString("data"));
                    produto.setId(obj.getLong("id"));
                    produto.setSubTotal(Float.parseFloat(obj.getString("SubTotal")));
                    produto.setQuantidade(obj.getInt("quantidade"));
                    //produto.setVendedor_id(obj.getString("vendedorId"));

                    lista_de_produtos.add(produto);
                }
            }
        }
        return lista_de_produtos;
    }

    public void Logout() {
        editor.putString("Token", null);
        editor.commit();
    }

    public String getToken() {
        return pref.getString("Token", null);
    }
}
