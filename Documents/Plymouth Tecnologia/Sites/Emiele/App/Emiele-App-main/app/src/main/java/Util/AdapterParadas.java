package Util;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import Bean.ProdutoDTO;
import Bean.Remessa;
import Bean.Viagem;
import br.com.softsaj.gibgasbeta.R;

public class AdapterParadas extends BaseAdapter {

    private final List<ProdutoDTO> ProdutoDTOs;
    private final Activity act;

    public AdapterParadas(List<ProdutoDTO> cursos, Activity Act) {
        this.ProdutoDTOs = cursos;
        this.act = Act;
    }

    @Override
    public int getCount() {
        return ProdutoDTOs.size();
    }

    @Override
    public ProdutoDTO getItem(int position) {
        return ProdutoDTOs.get(position);
    }

    @Override
    public long getItemId(int position) {

        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = act.getLayoutInflater()
                .inflate(R.layout.lista_de_paradas, parent, false);

        ProdutoDTO produtoDTO  = ProdutoDTOs.get(position);

        //pegando as referências das Views
        TextView origem = (TextView) view.findViewById(R.id.textView51);
        origem.setText(produtoDTO.getCodigo()+"    \n"+produtoDTO.getQuantidade()+"    x    R$ "+
                produtoDTO.getPrecoun()+"            R$ "+produtoDTO.getSubTotal());

        ImageView imagem = (ImageView) view.findViewById(R.id.imageView15);
        imagem.setClipToOutline(true);

        try {
            byte[] image = produtoDTO.getData().getBytes("UTF-8");
            String base64 = produtoDTO.getData();
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
