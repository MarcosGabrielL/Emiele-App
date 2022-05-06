package br.com.softsaj.gibgasbeta;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

import java.io.IOException;

import Bean.AuthRequestRegister;
import Bean.StoreManager;
import Dao.Connector;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Entrar extends AppCompatActivity {



    private Button blogin;
    private Button besqueceu ;
    private EditText email ;
    private EditText senha ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_entrar);

        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

        //-------------------------------------
        blogin = (Button) findViewById(R.id.button3);
        besqueceu = (Button) findViewById(R.id.button4);
        email = (EditText) findViewById(R.id.editText3);
        senha = (EditText) findViewById(R.id.editText4);

        blogin.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                /**
                 * Login e abre tela principal
                 */
                try {
                    login(email.getText().toString().trim(),senha.getText().toString().trim());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });

        besqueceu.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                /**
                 * Evento Redefinição de Senha
                 */
                startActivity(new Intent(getBaseContext(),ResetarSenha.class));
            }
        });
    }

    private void login(String Email, String Senha) throws IOException {

        final String token = Email;
        OkHttpClient client = new OkHttpClient();
         String url= "https://emiele-service-security.herokuapp.com/authenticate";
        /*
        return this.http.post<String>(`${this.baseUrl}/authenticate`, request, {  responseType: 'text' as 'json' });
        authRequestRegister:any ={
        "email":"email",
        "password":"pass"
      };*/


        MediaType JSON = MediaType.parse("application/json; charset=utf-8");
         AuthRequestRegister authRequest = new AuthRequestRegister();
         authRequest.setEmail(Email);
         authRequest.setPassword(Senha);

        RequestBody body = RequestBody.create(JSON, authRequest.toJSON());
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();


            client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                alert("Dados incorretos!");
                call.cancel();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                final String myResponse = response.body().string();

                //Salva LoggedUser
                StoreManager storeManager = new StoreManager(getApplicationContext());
                storeManager.setToken(token);

                //Abrir Pagina Principal
                startActivity(new Intent(getBaseContext(),GibGas.class));
                finish();

            }
        });





    }

    private void alert(String msg){
        Toast.makeText(Entrar.this, msg, Toast.LENGTH_SHORT).show();
    }
}
