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

import java.util.InputMismatchException;

import Bean.Remetentes;
import Bean.Transportador;
import Util.MaskEditUtil;

public class CadastroTransportador extends AppCompatActivity {

    private static Transportador transportador;
    private Boolean cpfvalido;

    private Button bcadastroremetente ;
    private EditText nome;
    private EditText email;
    private EditText telefone;
    private String sexo;
    private EditText nascimento ;
    private EditText cpf ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro_transportador);


        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        //--------------------------------------
        cpfvalido = false;
        transportador = new Transportador();
        bcadastroremetente = (Button) findViewById(R.id.bok1);
        nome = (EditText) findViewById(R.id.emp);
        email = (EditText) findViewById(R.id.cnpj1);
        telefone = (EditText) findViewById(R.id.eas);
        telefone.addTextChangedListener(MaskEditUtil.mask(telefone, MaskEditUtil.FORMAT_FONE));
        nascimento  = (EditText) findViewById(R.id.editText6);
        nascimento.addTextChangedListener(MaskEditUtil.mask(nascimento, MaskEditUtil.FORMAT_DATE));
        cpf = (EditText) findViewById(R.id.editText7);
        cpf.addTextChangedListener(MaskEditUtil.mask(cpf, MaskEditUtil.FORMAT_CPF));

        bcadastroremetente.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {

                /**
                 * Evento Bot??o Proxima Pagina
                 */

                PegaValores();
            }
        });

    }

    private void alert(String msg){
        Toast.makeText(CadastroTransportador.this, msg, Toast.LENGTH_SHORT).show();
    }

    public static Transportador getTransportador(){
        return transportador;
    }
    /**
     * Salva informa????es no remetente
     */
    public void PegaValores(){


        if(((RadioButton) findViewById(R.id.radioButton)).isSelected()){
            sexo = "Masculino";
        }
        if(((RadioButton) findViewById(R.id.radioButton2)).isSelected()){
            sexo = "Feminino";
        }

        transportador.setNome(nome.getText().toString());
        transportador.setEmail(email.getText().toString());
        transportador.setTelefone(telefone.getText().toString());
        transportador.setNascimento(nascimento.getText().toString());
        transportador.setSexo(sexo);

        //alert(remetente.getNome());

        if(!(transportador.getNome().equals("") && transportador.getEmail().equals("")
                && transportador.getTelefone().equals("") && transportador.getNascimento().equals("") && transportador.getSexo().equals(""))) {
            // alert("Aguarde3");
            if (isCPF(cpf.getText().toString().replace(".","").replace("-",""))) {
                transportador.setCpf(cpf.getText().toString());
                cpfvalido = true;
                //alert("cpf valido");
            } else {
                mostramensagem();//
            }
        }

        if(cpfvalido){
            /**
             * Passa Pra pagina dois cadastro remetente
             */
            //alert("pagina dois cadastro");
            startActivity(new Intent(getBaseContext(), CadastroTransportador2.class));

        }


    }

    public void mostramensagem(){

        Context context = getApplicationContext();
        CharSequence text = "CPF inv??lido!";
        int duration = Toast.LENGTH_SHORT;

        Toast toast = Toast.makeText(context, text, duration);
        toast.show();
    }

    public boolean isCPF(String CPF) {
        // considera-se erro CPF's formados por uma sequencia de numeros iguais
        if (CPF.equals("00000000000") || CPF.equals("11111111111") ||
                CPF.equals("22222222222") || CPF.equals("33333333333") ||
                CPF.equals("44444444444") || CPF.equals("55555555555") ||
                CPF.equals("66666666666") || CPF.equals("77777777777") ||
                CPF.equals("88888888888") || CPF.equals("99999999999") ||
                (CPF.length() != 11))
            return(false);

        char dig10, dig11;
        int sm, i, r, num, peso;

        // "try" - protege o codigo para eventuais erros de conversao de tipo (int)
        try {
            // Calculo do 1o. Digito Verificador
            sm = 0;
            peso = 10;
            for (i=0; i<9; i++) {
                // converte o i-esimo caractere do CPF em um numero:
                // por exemplo, transforma o caractere '0' no inteiro 0
                // (48 eh a posicao de '0' na tabela ASCII)
                num = (int)(CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                dig10 = '0';
            else dig10 = (char)(r + 48); // converte no respectivo caractere numerico

            // Calculo do 2o. Digito Verificador
            sm = 0;
            peso = 11;
            for(i=0; i<10; i++) {
                num = (int)(CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                dig11 = '0';
            else dig11 = (char)(r + 48);

            // Verifica se os digitos calculados conferem com os digitos informados.
            if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
                return(true);
            else return(false);
        } catch (InputMismatchException erro) {
            return(false);
        }
    }
}
