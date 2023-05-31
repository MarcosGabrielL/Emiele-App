import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/login.dart';
import 'package:jurisconexao_cliente/pages/new_solicitation.dart';
import 'package:jurisconexao_cliente/screens/forgot_password/forgot_password_screen.dart';
import 'package:jurisconexao_cliente/screens/home/components/home_header.dart';
import 'package:jurisconexao_cliente/screens/otp/otp_screen.dart';
import 'package:jurisconexao_cliente/screens/splash/splash_screen.dart';
import 'package:jurisconexao_cliente/service/security.dart';
import 'package:jurisconexao_cliente/widgets/category_selector.dart';
import 'package:jurisconexao_cliente/widgets/favorite_contacts.dart';
import 'package:jurisconexao_cliente/widgets/favorits_categories.dart';
import 'package:jurisconexao_cliente/widgets/info_categories.dart';
import 'package:jurisconexao_cliente/widgets/recent_chats.dart';
import 'package:jurisconexao_cliente/components/fab_bottom_app_bar.dart';

import 'components/bottomnavigate_bar.dart';
import 'components/config/size_config.dart';
import 'components/custom_floatingActionButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurisconexao',
      theme: ThemeData(
        primaryColor: const Color(0xFF011C38),
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
          CategorySelector(),
          CategoriesGuield(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white,
                    Colors.grey,
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
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: CustomBottomAppBar(),
      ),
    );
  }
}
