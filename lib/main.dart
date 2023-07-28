
import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/MyHomePAge.dart';
import 'package:jurisconexao_cliente/screens/splash/splash_screen.dart';
import 'package:jurisconexao_cliente/service/Anuncio.dart';
import 'package:jurisconexao_cliente/service/File.dart';
import 'package:jurisconexao_cliente/service/Produto.dart';
import 'package:jurisconexao_cliente/service/security.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/config/service/Config.dart';
import 'components/config/size_config.dart';
import 'components/constant.dart';
import 'models/Anuncio.dart';
import 'models/Cor.dart';
import 'models/Product.dart';
import 'models/files/FileDB.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurisconexao',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0x20FEF9EB)),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: fetchConfig(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.data == true) {
            return MyHomePage(title: 'Flutter Demo Home Page');
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<bool> fetchConfig(BuildContext context) async {
    AuthService authManager = AuthService();
    bool isLoggedIn = false; // Variable to control if the user is logged in
    bool isFirstTime = true;


      SizeConfig sizes = SizeConfig();
      sizes.init(context);

      ConfigService configService = ConfigService(); // Create an instance of ConfigService
      AnuncioService anuncioService = AnuncioService();
      FileService fileService = FileService();
      ProdutoService produtoService = ProdutoService();


      try {
        vendedor = await configService.getVendedorById(vendedor_Id, "");
        //print(vendedor);
        logov = await fileService.findVendedorLogo(vendedor_Id, "");
        for (var logo in logov) {
         // print("logo: "+ logo.toString());
        }
      } catch (error) {
        print("Error fetching Vendedor: $error");
        // Handle error if needed
      }

      try {
        List<CorModel> colors = await configService.findColorsByIdVendedor(vendedor_Id, token);
        for (var color in colors) {
         // print(color.toString());
          kPrimaryColor = Color(int.parse(color.primaryColor.replaceAll('#', '0xFF')));
          kSecondaryColor = Color(int.parse(color.secondary.replaceAll('#', '0xFF')));
        }
      } catch (error) {
        //print("Error fetching colors: $error");
        // Handle error if needed
      }

      isLoggedIn = await authManager.checkLoginStatus();
      isFirstTime = await authManager.checkisFirstTimeStatus();
      print("isLoggedIn"+isLoggedIn.toString());
      print("isFirstTime"+isFirstTime.toString());
      //setState(() {}); // Update the state to reflect the login status change

      SharedPreferences _preferences = await SharedPreferences.getInstance();
      if(_preferences.containsKey("loggedUser")) {
        user = await authManager.getUserByEmail(
            _preferences.get("loggedUser").toString());
        //print("Usuario" + user.toString());
      }



      try {
        List<Anuncio> anuncios = await anuncioService.findAnuncioByIdVendedor(vendedor_Id, token);
        for (var anuncio in anuncios) {
          //print(anuncio.toString());
          kTitulo = anuncio.titulo;
          kSubTitulo = anuncio.subtitulo;
        }
      } catch (error) {
        print("Error fetching Anuncios: $error");
        // Handle error if needed
      }

      try {

        List<FileDB> files = await fileService.findBannersByIdVendedor(vendedor_Id, token);
        if(files.length > 1) {
          fileData1 = await fileService.findById(files[0].id, '');
          //print(fileData1);
          fileData2 = await fileService.findById(files[1].id, '');
        }else if(files.length == 1) {
          fileData1 = await fileService.findById(files[0].id, '');
        }else if(files.length == 1) {

        }

      } catch (error) {
        print("Error fetching Files: $error");
        // Handle error if needed
      }

      try {

        List<Product> produtosDetallhes = await produtoService.findProdutosDetalhesByIdVendedor(vendedor_Id,1, token);

        ProdutosDestacados = [];
        ProdutosDetalhes = [];
        for (var produto in produtosDetallhes) {
          //print(produto.toJson());
          if(produto.destaque){
            ProdutosDestacados.add(produto);
          }
          ProdutosDetalhes.add(produto);
        }

        print(produtosDetallhes.length.toString() +" Produtos no Total");

      } catch (error) {
        print("Error fetching Produtos Detalhes: $error");
        // Handle error if needed
      }

      return true;

    }
}
