import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/models/message_model.dart';
import 'package:jurisconexao_cliente/screens/chat_screen.dart';

import '../components/bottomnavigate_bar.dart';
import '../components/config/size_config.dart';
import '../components/custom_floatingActionButton.dart';
import '../screens/home/components/home_header.dart';
import '../widgets/category_selector.dart';
import '../widgets/favorite_contacts.dart';
import '../widgets/favorits_categories.dart';
import '../widgets/info_categories.dart';
import '../widgets/recent_chats.dart';

class RecentChats2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white, //Theme.of(context).primaryColor,

      body: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(40)),
          HomeHeader(),
          CategorySelector(),
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
                  FavoriteContacts(),
                  RecentChats(),
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
