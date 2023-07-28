import 'package:flutter/material.dart';

import '../../components/constant.dart';
import '../../models/Cart.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Seu Carrinho",
            style: TextStyle(color: Colors.black),
          ),
          Text(
              "${carrinho.length} ${carrinho.length != 1 ? 'itens' : 'item'}",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}