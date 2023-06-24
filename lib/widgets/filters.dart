import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/price_filter.dart';
import 'package:jurisconexao_cliente/models/message_model.dart';
import 'package:jurisconexao_cliente/screens/chat_screen.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  double hightFiltres = 5.0;
  bool isOptionsVisible = true;

  _buildMessageComposer(BuildContext context) {
    return AnimatedOpacity(
      opacity: isOptionsVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color:  Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('SlideButton'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Filtros',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                  ),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),

          ),
          PriceFilter(),
          Container(
            height: hightFiltres,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: favorites[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          //_buildMessageComposer(context),
        ],
      ),
    );
  }
}
