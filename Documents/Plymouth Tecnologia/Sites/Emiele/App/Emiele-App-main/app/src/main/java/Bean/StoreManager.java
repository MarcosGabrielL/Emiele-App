package Bean;

import android.content.Context;
import android.content.SharedPreferences;

import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

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

    public void setProductOnCart(ProdutoDTO p) throws JSONException {
        ArrayList<ProdutoDTO> lista_de_produtos = new ArrayList<ProdutoDTO>();
        String carrinhoString = pref.getString("cart", null);
        if(carrinhoString!=null){
            JSONArray array = new JSONArray(carrinhoString);
            for(int i=0; i< array.length(); i++){
                JSONObject obj = array.getJSONObject(i);

                ProdutoDTO produto = new ProdutoDTO();
                produto.setCodigo(obj.getString("codigo"));
                produto.setPrecoun(obj.getString("precoun"));
                produto.setData(new JSONArray(obj.getString("files")).getJSONObject(0).getString("data"));
                produto.setId(obj.getLong("id"));
                produto.setVendedor_id(obj.getString("vendedorId"));

                lista_de_produtos.add(produto);
            }
            lista_de_produtos.add(p);

        }else {
            lista_de_produtos.add(p);
        }

        editor.putString("cart", new Gson().toJson(lista_de_produtos));
        editor.commit();
    }

    public void Logout() {
        editor.putString("Token", null);
        editor.commit();
    }

    public String getToken() {
        return pref.getString("Token", null);
    }
}
