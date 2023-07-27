import 'package:flutter/material.dart';

import '../../components/constant.dart';
import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  bool isdestaque;
  int id;

  DetailsScreen({required this.id, required this.isdestaque}); // Constructor that accepts the ID


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(favorito: isdestaque? ProdutosDestacados[id].favorito : ProdutosDetalhes[id].favorito),
      ),
      body: Body(product: isdestaque? ProdutosDestacados[id] : ProdutosDetalhes[id]),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}