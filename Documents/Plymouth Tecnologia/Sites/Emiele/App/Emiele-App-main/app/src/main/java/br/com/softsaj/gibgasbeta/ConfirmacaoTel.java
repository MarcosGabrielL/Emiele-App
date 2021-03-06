package br.com.softsaj.gibgasbeta;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

import java.util.concurrent.TimeUnit;

import Bean.Remetentes;
import Dao.Connector;

public class ConfirmacaoTel extends AppCompatActivity {


    private String numero;

    private String mVerificationId;
    private EditText Code;
    private FirebaseAuth auth;
    private FirebaseUser user ;
    public static int Tipo;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_confirmacao_tel);

        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);



        //------------------------------------------------------
        Remetentes remetente = CadastroRemetente3.getRemetente();
        Code = (EditText) findViewById(R.id.editText);
        TextView num = (TextView) findViewById(R.id.textView5);
        Button confirmar = (Button) findViewById(R.id.button5);
        Button depois = (Button) findViewById(R.id.button8);

        auth = Connector.getFirebaseAuth();
        user = Connector.getFirebaseUser();

        numero = remetente.getTelefone();

        num.setText(numero);

        //alert(numero);

        confirmar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                /**
                 * Evento Bot??o Confirmar
                 */
                Confere();
            }
        });

        depois.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                /**
                 * Evento Bot??o Depois
                 */
                startActivity(new Intent(getBaseContext(), GibGas.class));
            }
        });


                mandamensagem();

    }

    public void mandamensagem(){
        if(user != null){
            //Este m??todo ir?? enviar o c??digo de verifica????o
            PhoneAuthProvider.getInstance().verifyPhoneNumber(
                    "+55"+numero.replace(")","").replace("(", "").replace("-",""),        // Phone number to verify
                    60,                 // Timeout duration
                    TimeUnit.SECONDS,   // Unit of timeout
                    this,               // Activity (for callback binding)
                    mCallbacks);        // OnVerificationStateChangedCallbacks
        }else{
            //not signed in
        }
    }

    //Confere se codigo digitado ?? igual ao enviado
    public void Confere(){
        alert("Aqui3");
        //Verifica o codigo
        if(Code.getText().toString().equals("")){
            alert("C??digo Inv??lido");
        }
         verifyVerificationCode(Code.getText().toString());
    }

    // Este ?? o nosso callback que nos ajudar?? a saber se o c??digo ?? enviado ou n??o. Tem tr??s m??todos.
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks mCallbacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {
       /*
       * este m??todo ?? chamado quando a verifica????o ?? conclu??da.
       * Aqui temos o objeto PhoneAuthCredential, que nos dar?? o c??digo, se for detectado automaticamente.
       * */
        @Override
        public void onVerificationCompleted(PhoneAuthCredential phoneAuthCredential) {
            //Obtendo o c??digo enviado por SMS
            String code = phoneAuthCredential.getSmsCode();

            // as vezes o c??digo n??o ?? detectado automaticamente
            // neste caso o c??digo ser?? nulo
            // ent??o o usu??rio tem que inserir manualmente o c??digo
            if (code != null) {
                Code.setText(code);
                //Verifica o codigo
                verifyVerificationCode(code);
            }
        }

        /*
        *  Este m??todo ?? chamado quando a verifica????o falha por alguns motivos,
        *  ent??o aqui estamos exibindo apenas um simples brinde.
        * */
        @Override
        public void onVerificationFailed(FirebaseException e) {
            Toast.makeText(ConfirmacaoTel.this, e.getMessage(), Toast.LENGTH_LONG).show();
            alert("C??digo Inv??lido");
        }

        /*
        * Isso ?? chamado quando o c??digo ?? enviado com sucesso.
        * O primeiro par??metro aqui ?? o nosso ID de verifica????o que ?? enviado.
        * Ent??o, estamos armazenando em nosso objeto mVerificationId .
        *
        * */
        @Override
        public void onCodeSent(String s, PhoneAuthProvider.ForceResendingToken forceResendingToken) {
            super.onCodeSent(s, forceResendingToken);
            mVerificationId = s;
            //alert(s);
        }
    };

    /*
    * Para verificar o c??digo de verifica????o, usaremos esse m??todo.
    * Se a verifica????o for bem-sucedida, permitiremos que o usu??rio fa??a login no aplicativo.
    *
    * */
    private void verifyVerificationCode(String otp) {
        //creating the credential
        PhoneAuthCredential credential = PhoneAuthProvider.getCredential(mVerificationId, otp);


        //signing the user
        signInWithPhoneAuthCredential(credential);
    }

    private void signInWithPhoneAuthCredential(PhoneAuthCredential credential) {
        auth.getCurrentUser().linkWithCredential(credential)
                .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if (task.isSuccessful()) {

                            //verifica????o bem sucedida vamos come??ar a atividade de perfil
                            startActivity(new Intent(getBaseContext(), BemVindo.class));

                        } else {

                            //verifica????o malsucedida .. exibir uma mensagem de erro

                            String message = "verifica????o malsucedida!";

                            if (task.getException() instanceof FirebaseAuthInvalidCredentialsException) {
                                message = "Invalid code entered...";
                            }

                                alert(message);
                        }
                    }
                });
    }

    private void alert(String msg){
        Toast.makeText(ConfirmacaoTel.this, msg, Toast.LENGTH_SHORT).show();
    }

    public static void tipo(int t){
        Tipo = t;
    }

}


