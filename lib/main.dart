import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/login.dart';
import 'package:jurisconexao_cliente/screens/home/components/home_header.dart';
import 'package:jurisconexao_cliente/screens/splash/splash_screen.dart';
import 'package:jurisconexao_cliente/service/Anuncio.dart';
import 'package:jurisconexao_cliente/service/File.dart';
import 'package:jurisconexao_cliente/service/Produto.dart';
import 'package:jurisconexao_cliente/service/security.dart';
import 'package:jurisconexao_cliente/widgets/category_selector.dart';
import 'package:jurisconexao_cliente/widgets/favorits_categories.dart';
import 'package:jurisconexao_cliente/widgets/info_categories.dart';
import 'package:jurisconexao_cliente/widgets/others_list_front.dart';
import 'components/bottomnavigate_bar.dart';
import 'components/config/service/Config.dart';
import 'components/config/size_config.dart';
import 'components/constant.dart';
import '../../../models/Cor.dart';
import 'dart:convert';
import 'models/Anuncio.dart';
import 'models/Product.dart';
import 'models/Venda/Produto.dart';
import 'models/Venda/ProdutoDTO.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService authManager = AuthService();
  bool isLoggedIn = false; // Variable to control if the user is logged in
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn = await authManager.checkLoginStatus();
    isFirstTime = await authManager.checkisFirstTimeStatus();

    setState(() {}); // Update the state to reflect the login status change
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: fetchConfig(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
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
          // While waiting for the future to complete, show the splash screen
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Handle error state if the future throws an error
          }else {
            if (isFirstTime) {
              return SplashScreen();
            } else {
              if (!isLoggedIn) {
                return LoginPage(); // Se o usuário não estiver logado, retorna a página de login
              }
            }

            return Scaffold(
              backgroundColor: Colors.white, //Theme.of(context).primaryColor,

              body: Column(
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(40)),
                  HomeHeader(),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  CategorySelector(),
                  CategoriesGuield(),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          stops: [0.8, 1.0],
                          colors: [
                            Colors.white,
                            Colors.white, //gradiente
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          FavoriteCotegories(),
                          ListFront(),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              //floatingActionButton: CustomFloatingActionButton(),
              bottomNavigationBar: Container(
                height: 50.0, // Defina a altura desejada aqui
                child: CustomBottomAppBar(),
              ),
            );
          }});
  }

  Future<bool> fetchConfig() async {
    SizeConfig sizes = SizeConfig();
    sizes.init(context);

    ConfigService configService = ConfigService(); // Create an instance of ConfigService
    AnuncioService anuncioService = AnuncioService();
    FileService fileService = FileService();
    ProdutoService produtoService = ProdutoService();
    try {
      List<CorModel> colors = await configService.findColorsByIdVendedor(vendedor_Id, token);
      for (var color in colors) {
        print(color.toString());
        kPrimaryColor = Color(int.parse(color.primaryColor.replaceAll('#', '0xFF')));
        kSecondaryColor = Color(int.parse(color.secondary.replaceAll('#', '0xFF')));
      }
    } catch (error) {
      print("Error fetching colors: $error");
      // Handle error if needed
    }

    try {
      List<Anuncio> anuncios = await anuncioService.findAnuncioByIdVendedor(vendedor_Id, token);
      for (var anuncio in anuncios) {
        print(anuncio.toString());
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

    /*try {
      List<ProdutoDTO> produtosDestacados = await produtoService.findProdutosDestaquesByIdVendedor(vendedor_Id, token);
      ProdutosDestacados = [];
      for (var produto in produtosDestacados) {
      }
      print(ProdutosDestacados.length.toString() +" Produtos Destacados");
    } catch (error) {
      print("Error fetching Produtos Destacados: $error");
      // Handle error if needed
    }*/

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
