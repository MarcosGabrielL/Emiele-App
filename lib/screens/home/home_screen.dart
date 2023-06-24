import 'package:flutter/material.dart';

import '../../components/bottomnavigate_bar.dart';
import '../../components/config/enums.dart';
import '../../components/custom_floatingActionButton.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: CustomBottomAppBar(),
      ),
    );
  }
}