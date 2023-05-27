import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/new_solicitation.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Defina a altura desejada aqui
      child: BottomAppBar(
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
                  MaterialPageRoute(builder: (context) => NewSoliticitacion()),
                );
              },
              color: Colors.white,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.search, size: 25.0),
              onPressed: () {
                // Adicione a lógica aqui para o botão de pesquisa
              },
              color: Colors.white,
            ),

            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.person, size: 25.0),
              onPressed: () {
                // Adicione a lógica aqui para o botão de favoritos
              },
              color: Colors.white,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.settings, size: 25.0),
              onPressed: () {
                // Adicione a lógica aqui para o botão de configurações
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
