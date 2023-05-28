import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/home/home_screen.dart';

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
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.search, size: 25.0),
            onPressed: () {
              // Adicione sua lógica aqui para o botão de pesquisa
            },
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.favorite, size: 0),
            onPressed: () {
              // Adicione sua lógica aqui para o botão de favoritos
            },
            color: Colors.transparent,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.chat, size: 25.0),
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
            icon: Icon(Icons.settings, size: 25.0),
            onPressed: () {
              // Adicione sua lógica aqui para o botão de configurações
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
