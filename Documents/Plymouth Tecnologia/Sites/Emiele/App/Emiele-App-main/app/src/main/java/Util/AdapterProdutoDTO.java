package Util;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Random;

import Bean.ProdutoDTO;
import Bean.Remessa;
import br.com.softsaj.gibgasbeta.R;

public class AdapterProdutoDTO extends BaseAdapter {

    private final List<ProdutoDTO> produtoDTOS;
    private final Activity act;

    public AdapterProdutoDTO(List<ProdutoDTO> cursos, Activity Act) {

        this.produtoDTOS = cursos;
        this.act = Act;
    }

    @Override
    public int getCount() {
        return produtoDTOS.size();
    }

    @Override
    public ProdutoDTO getItem(int position) {

        return produtoDTOS.get(position);
    }

    @Override
    public long getItemId(int position) {

        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = act.getLayoutInflater()
                .inflate(R.layout.lista_de_viagens, parent, false);

        ProdutoDTO remessa  = produtoDTOS.get(position);

        //pegando as referências das Views
        TextView descricao = (TextView) view.findViewById(R.id.lista_curso_personalizada_descricao);
        TextView rating = (TextView) view.findViewById(R.id.lista_curso_personalizada_nome);
        TextView quantidadevotos = (TextView) view.findViewById(R.id.lista_curso_personalizada_nome2);
        TextView preço = (TextView)  view.findViewById(R.id.lista_curso_personalizada_descricao2);
        ImageView imagem = (ImageView) view.findViewById(R.id.lista_curso_personalizada_imagem);
        imagem.setClipToOutline(true);

        //populando as Views
        descricao.setText(remessa.getCodigo());
        rating.setText("4.0");
        quantidadevotos.setText(""+new Random().nextInt(100-10)+10);
        preço.setText("R$ "+remessa.getPrecoun());




        try {
            byte[] image = remessa.getData().getBytes("UTF-8");
            String base64 = remessa.getData();
            BitmapFactory.Options op = new BitmapFactory.Options();
            op.inSampleSize=8;
            Bitmap yourSelectedImage = BitmapFactory.decodeByteArray(image, 0 , image.length);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            //yourSelectedImage.compress(Bitmap.CompressFormat.PNG, 100, baos);
            //byte[] byteArrayImage = baos.toByteArray();
            byte[]  byteArray = Base64.decode(base64, Base64.DEFAULT);
            Bitmap bmp1 = BitmapFactory.decodeByteArray(byteArray, 0 , byteArray.length);
            //Log.i("Tracee","getHeight[]: "+bmp1.getHeight());
            //Log.i("Tracee","getWidth[]: "+bmp1.getWidth());
            String encodedImage = Base64.encodeToString(byteArray, Base64.DEFAULT);
                imagem.setImageBitmap(bmp1);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }






        return view;
    }
}
