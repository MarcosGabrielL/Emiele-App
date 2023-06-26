import 'package:flutter/material.dart';
import '../components/bottomnavigate_bar.dart';
import '../components/config/size_config.dart';
import '../screens/home/components/home_header.dart';
import '../widgets/category_selector.dart';
import '../widgets/orders_widget.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white, //Theme.of(context).primaryColor,

      body: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(40)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(20)),
          CategorySelector(),
          SizedBox(height: getProportionateScreenHeight(40)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  //FavoriteContacts(),
                  Orders(), //Orders
                ],
              ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: CustomBottomAppBar(),
      ),
    );
  }
}
