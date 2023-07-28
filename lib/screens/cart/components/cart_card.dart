import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../components/config/size_config.dart';
import '../../../components/constant.dart';
import '../../../models/Cart.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Imagem do produto
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.memory(
                    Uint8List.fromList(Base64Decoder().convert(cart.product.urls[0])),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          // Detalhes do produto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.codigo,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "R\$ ${cart.product.precoun}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor
                    ),
                    children: [
                      TextSpan(
                        text: " x ${cart.numOfItem}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Valor total do produto
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                color: cart.product.favorito ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                "R\$\n${(double.parse(cart.product.precoun) * cart.numOfItem).toStringAsFixed(2)}", // Utilizando String interpolation
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
