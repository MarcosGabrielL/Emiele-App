import 'package:flutter/material.dart';

import '../components/constant.dart';
import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: ProdutosDetalhes[0], numOfItem: 2),
  Cart(product: ProdutosDetalhes[1], numOfItem: 1),
  Cart(product: ProdutosDetalhes[3], numOfItem: 1),
];