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

        /**
        Bitmap bmp = null;

        try {
            bmp = BitmapFactory.decodeByteArray(remessa.getData().getBytes("UTF-8"), 0, remessa.getData().getBytes("UTF-8").length);
            Log.i("Tracee","Byte[]: "+remessa.getData().getBytes("UTF-8"));
            Log.i("Tracee","Length: : "+remessa.getData().getBytes("UTF-8").length);
            Log.i("Tracee","Bitmap: "+remessa.getData().getBytes("UTF-8").length);
            //imagem.setImageBitmap(bit);
            //ByteArrayOutputStream stream = new ByteArrayOutputStream();
            //stream.write(remessa.getData().getBytes("UTF-8"));
            //bmp.compress(Bitmap.CompressFormat.PNG, 100, stream );
            //Bitmap decoded =BitmapFactory.decodeStream(new ByteArrayInputStream(stream.toByteArray()));
            //imagem.setImageBitmap(decoded);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }*/

         /*try {
           // Bitmap bit = BitmapFactory.decodeByteArray(remessa.getData().getBytes("UTF-8"), 0, remessa.getData().getBytes("UTF-8").length);
            Bitmap bit = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
            ByteBuffer buffer = ByteBuffer.wrap(remessa.getData().getBytes("UTF-8"));
            bit.copyPixelsFromBuffer(buffer);

            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            bit.compress(Bitmap.CompressFormat.PNG, 100, stream );

            imagem.setImageBitmap(BitmapFactory.decodeStream(new ByteArrayInputStream(stream.toByteArray())));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }*/


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
            Log.i("Tracee","getHeight[]: "+bmp1.getHeight());
            Log.i("Tracee","getWidth[]: "+bmp1.getWidth());
            String encodedImage = Base64.encodeToString(byteArray, Base64.DEFAULT);
                imagem.setImageBitmap(bmp1);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }






        return view;
    }
}
