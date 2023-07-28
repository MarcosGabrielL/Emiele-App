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
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/Cor.dart';
import '../components/bottomnavigate_bar.dart';
import '../components/config/service/Config.dart';
import '../components/config/size_config.dart';
import '../components/constant.dart';
import '../models/Anuncio.dart';
import '../models/Product.dart';
import '../models/files/FileDB.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


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
     check();
  }

  Future<void> check() async {
    isLoggedIn = await authManager.checkLoginStatus();
    isFirstTime = await authManager.checkisFirstTimeStatus();
    setState(() {
    });
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


}