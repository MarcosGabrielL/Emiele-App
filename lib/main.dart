import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/login.dart';
import 'package:jurisconexao_cliente/screens/home/components/home_header.dart';
import 'package:jurisconexao_cliente/screens/splash/splash_screen.dart';
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
    fetchColors();

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
  }

  void fetchColors() async {
    ConfigService configService = ConfigService(); // Create an instance of ConfigService

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

  }
}
