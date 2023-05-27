import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/widgets/category_areas.dart';

class PriceFilter extends StatefulWidget {
  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _currentRangeValues = RangeValues(0, 1000);
  late String selectedOption; // Valores iniciais do filtro

  @override
  void initState() {
    super.initState();
    selectedOption = '  Direito Civil';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Preço disposto a Pagar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 1000,
            divisions: 10,
            // activeColor: Colors.white, // Define a cor da faixa selecionada
            inactiveColor: Colors.white, // Define a cor da faixa não selecionada
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$${_currentRangeValues.start.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white), // Define a cor do texto como branco
              ),
              Text(
                '\$${_currentRangeValues.end.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white), // Define a cor do texto como branco
              ),
            ],
          ),
          SizedBox(height: 20.0),
          CategoryAreas(),

        ],
      ),
    );
  }
}
