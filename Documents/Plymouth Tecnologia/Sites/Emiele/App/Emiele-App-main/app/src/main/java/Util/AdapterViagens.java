package Util;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import Bean.Viagem;
import br.com.softsaj.gibgasbeta.R;

public class AdapterViagens extends BaseAdapter {

    private final List<Viagem> viagens;
    private final Activity act;

    public AdapterViagens(List<Viagem> cursos, Activity Act) {
        this.viagens = cursos;
        this.act = Act;
    }

    @Override
    public int getCount() {
        return viagens.size();
    }

    @Override
    public Viagem getItem(int position) {
        return viagens.get(position);
    }

    @Override
    public long getItemId(int position) {

        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = act.getLayoutInflater()
                .inflate(R.layout.lista_de_viagens, parent, false);

        Viagem viagem  = viagens.get(position);

        //pegando as referĂȘncias das Views
        TextView nome = (TextView)
                view.findViewById(R.id.lista_curso_personalizada_nome);
        TextView descricao = (TextView)
                view.findViewById(R.id.lista_curso_personalizada_descricao);
        ImageView imagem = (ImageView)
                view.findViewById(R.id.lista_curso_personalizada_imagem);
        ImageView retirada = (ImageView)
                view.findViewById(R.id.lista_curso_personalizada_retirada);
        TextView valor = (TextView)
                view.findViewById(R.id.textView58);


            try {
                    descricao.setText("Destino:" + viagem.getCidade_destino());
                    valor.setText("R$: " + viagem.getCidade_destino_valor());
            } catch (Exception e) {
                e.printStackTrace();
            }

        nome.setText("Origem: " + viagem.getCidade_origem());


        if (viagem.getTipo().equals("AviĂŁo")) {
            imagem.setImageResource(R.drawable.airplane);
        } else if (viagem.getTipo().equals("Bike")) {
            imagem.setImageResource(R.drawable.bicycle);
        } else if (viagem.getTipo().equals("CaminhĂŁo")) {
            imagem.setImageResource(R.drawable.truck);
        }else if (viagem.getTipo().equals("Carro")) {
            imagem.setImageResource(R.drawable.car);
        }else if (viagem.getTipo().equals("Motocicleta")) {
            imagem.setImageResource(R.drawable.motorbike);
        }else if (viagem.getTipo().equals("PĂ©")) {
            imagem.setImageResource(R.drawable.walker);
        }else if (viagem.getTipo().equals("Transporte PĂșblico")) {
            imagem.setImageResource(R.drawable.bus);
        }

        if(viagem.getRetirada().equals("Vou atĂ© vocĂȘ")){
            retirada.setBackgroundColor(Color.rgb(0, 153, 51));
        } else if(viagem.getRetirada().equals("Vem atĂ© mim")){
            retirada.setBackgroundColor(Color.rgb(221, 46, 68));
        } else if(viagem.getRetirada().equals("Vamos negociar")){
            retirada.setBackgroundColor(Color.rgb(0, 102, 255));
        }

        return view;
    }

    protected static float checkSimilarity(String sString1, String sString2) throws Exception {

        // Se as strings tĂȘm tamanho distinto, obtĂȘm a similaridade de todas as
        // combinaĂ§Ă”es em que tantos caracteres quanto a diferenĂ§a entre elas sĂŁo
        // inseridos na string de menor tamanho. Retorna a similaridade mĂĄxima
        // entre todas as combinaĂ§Ă”es, descontando um percentual que representa
        // a diferenĂ§a em nĂșmero de caracteres.
        if(sString1.length() != sString2.length()) {
            int iDiff = Math.abs(sString1.length() - sString2.length());
            int iLen = Math.max(sString1.length(), sString2.length());
            String sBigger, sSmaller, sAux;

            if(iLen == sString1.length()) {
                sBigger = sString1;
                sSmaller = sString2;
            }
            else {
                sBigger = sString2;
                sSmaller = sString1;
            }

            float fSim, fMaxSimilarity = Float.MIN_VALUE;
            for(int i = 0; i <= sSmaller.length(); i++) {
                sAux = sSmaller.substring(0, i) + sBigger.substring(i, i+iDiff) + sSmaller.substring(i);
                fSim = checkSimilaritySameSize(sBigger,  sAux);
                if(fSim > fMaxSimilarity)
                    fMaxSimilarity = fSim;
            }
            return fMaxSimilarity - (1f * iDiff) / iLen;

            // Se as strings tĂȘm o mesmo tamanho, simplesmente compara-as caractere
            // a caractere. A similaridade advĂ©m das diferenĂ§as em cada posiĂ§ĂŁo.
        } else
            return checkSimilaritySameSize(sString1, sString2);
    }

    protected static float checkSimilaritySameSize(String sString1, String sString2) throws Exception {

        if(sString1.length() != sString2.length())
            throw new Exception("Strings devem ter o mesmo tamanho!");

        int iLen = sString1.length();
        int iDiffs = 0;

        // Conta as diferenĂ§as entre as strings
        for(int i = 0; i < iLen; i++)
            if(sString1.charAt(i) != sString2.charAt(i))
                iDiffs++;

        // Calcula um percentual entre 0 e 1, sendo 0 completamente diferente e
        // 1 completamente igual
        return 1f - (float) iDiffs / iLen;
    }
}
