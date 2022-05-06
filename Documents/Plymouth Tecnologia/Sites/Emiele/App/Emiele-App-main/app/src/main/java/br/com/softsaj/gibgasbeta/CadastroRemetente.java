package br.com.softsaj.gibgasbeta;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import java.io.IOException;
import java.util.InputMismatchException;

import Bean.AuthRequest;
import Bean.AuthRequestRegister;
import Bean.Remetentes;
import Bean.StoreManager;
import Util.MaskEditUtil;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class CadastroRemetente extends AppCompatActivity {

    private static Remetentes remetente ;


    private Button bcadastroremetente ;
    private Button blogin ;
    private EditText email;
    private EditText password;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro_remetente);

        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);


        remetente = new Remetentes();
        bcadastroremetente = (Button) findViewById(R.id.button3);
        blogin = (Button) findViewById(R.id.button4);
        password = (EditText) findViewById(R.id.editText4);
        email = (EditText) findViewById(R.id.editText3);


        bcadastroremetente.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                /**
                 * Evento Botão Proxima Pagina
                 */
                alert("Pega Valores");
                PegaValores(email.getText().toString().trim(),password.getText().toString().trim(), " ", " ", "3");
            }
        });

        blogin.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                /**
                 * Evento Botão Proxima Pagina
                 */

                startActivity(new Intent(getBaseContext(),Entrar.class));
                finish();
            }
        });
    }

    private void alert(String msg){
        Toast.makeText(CadastroRemetente.this, msg, Toast.LENGTH_SHORT).show();
    }

    public static Remetentes getRemetente(){
        return remetente;
    }


    public void PegaValores(final String Email, final String Senha, String FirtName, String LastName, String Tipo){

        alert("Processando Informações");

        OkHttpClient client = new OkHttpClient();
        String url= "https://emiele-service-security.herokuapp.com/process_register";
        /*
        return this.http.post<String>(`${this.baseUrl}/authenticate`, request, {  responseType: 'text' as 'json' });
        authRequestRegister:any ={
        "email":"email",
        "password":"pass"
      };*/
        MediaType JSON = MediaType.parse("application/json; charset=utf-8");
        AuthRequest authRequest = new AuthRequest();
        authRequest.setEmail(Email);
        authRequest.setFirstName(FirtName);
        authRequest.setLastName(LastName);
        authRequest.setPassword(Senha);
        authRequest.setTipo(Tipo);

        RequestBody body = RequestBody.create(JSON, authRequest.toJSON());
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();
        alert("Enviando Dados");

        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                alert("Dados incorretos!");
                call.cancel();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                final String myResponse = response.body().string();

                //Abrir Pagina Principal
                Login(Email, Senha);


            }
        });


    }

    public void Login(String Email, String Senha){

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
                startActivity(new Intent(getBaseContext(), GibGas.class));
                finish();

            }
        });


    }

}

