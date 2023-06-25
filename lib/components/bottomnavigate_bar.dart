import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/RecentsOrders.dart';
import 'package:jurisconexao_cliente/screens/categories/search/search_by_category.dart';

import '../main.dart';
import '../models/message_model.dart';
import '../pages/recent_chats_2.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../widgets/new_chat.dart';
import '../widgets/recent_chats.dart';
import 'constant.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.home, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            color: Colors.white,
          ),

          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.list_alt, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecentOrders()), // NewChatScreen(user: james)),
              );
            },
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.favorite, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage()),
              );
            },
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.chat_outlined, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecentChats2()), // NewChatScreen(user: james)),
              );
            },
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.settings, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
