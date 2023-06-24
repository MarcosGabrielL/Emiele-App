import 'package:flutter/material.dart';

class CategoryAreas extends StatefulWidget {
  @override
  _CategoryAreasState createState() => _CategoryAreasState();
}

class _CategoryAreasState extends State<CategoryAreas> {
  int selectedIndex = 0;
  final List<String> categories = ['Direito Civil',
    'Direito Penal',
    'Direito Trabalhista',
    'Direito Empresarial',
    'Direito Tributário',
    'Direito Ambiental',
    'Direito Internacional',
    'Direito Administrativo',
    'Direito do Consumidor',
    'Direito Previdenciário',];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white60,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
