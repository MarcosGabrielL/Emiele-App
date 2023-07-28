import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/models/Cart.dart';
import 'package:jurisconexao_cliente/screens/cart/cart_screen.dart';

import '../../../components/config/size_config.dart';
import '../../../components/constant.dart';
import '../../../components/default_button.dart';
import '../../../components/rounded_icon_btn.dart';
import '../../../components/util/Cart.dart';
import '../../../models/Product.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:jurisconexao_cliente/service/SnackBar.dart';

class NavigationHelper {
  static void navigateToCartScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartScreen(),
      ),
    );
  }
}
class Body extends StatefulWidget {
  final Product product;
  late int quantidade;

  Body({Key? key, required this.product}) : super(key: key) {
    quantidade = 1; // Inicialização de quantidade com 1
  }

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  @override
  Widget build(BuildContext context) {

    Utf8Codec utf8codec = Utf8Codec();
    return ListView(
      children: [
        ProductImages(product: widget.product),
        SizedBox(height: getProportionateScreenWidth(10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(100)),
          child: Row(
            children: [
              Expanded(child: Container()), // Left Spacer
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {
                    setState(() {
                      widget.quantidade >= 1 ? widget.quantidade-- : 0;
                    });
                  },
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Text(
                ""+widget.quantidade.toString(),
                maxLines: 3,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  setState(() {
                    widget.quantidade++;
                });
                  },
              ),
              Expanded(child: Container()), // Right Spacer
            ],
          ),
        ),

        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [

            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    child: Text(
      widget.product.codigo,
    style: Theme.of(context).textTheme.headline6,
    ),
    ),
    Align(
    alignment: Alignment.topRight,
    child: Container(
    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
    width: getProportionateScreenWidth(80),
    decoration: BoxDecoration(
    color: widget.product.favorito ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    ),
    ),
    child: Text(
      "R\$\n${(double.parse(widget.product.precoun) * widget.quantidade).toStringAsFixed(2)}", // Utilizando String interpolation
    maxLines: 3,
    ),
    ),
    ),
    ],
    ),

    Padding(
    padding: EdgeInsets.only(
    left: getProportionateScreenWidth(20),
    right: getProportionateScreenWidth(64),
    ),
    child: Text(
    "",
    maxLines: 3,
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(
    horizontal: getProportionateScreenWidth(20),
    vertical: 10,
    ),
    child: GestureDetector(
    onTap: () {},
    child: Row(
    children: [
    Icon(
    Icons.arrow_forward_ios,
    size: 12,
    color: kPrimaryColor,
    ),

    SizedBox(width: 5),
    Text(
    utf8codec.decode(utf8codec.encode(widget.product.descricao)),
    style: TextStyle(
    fontWeight: FontWeight.w600, color: kPrimaryColor),
    ),
    ],
    ),
    ),
    )
    ],
    ),

              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //ColorDots(product: product),

                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: 0,
                        ),
                        child: DefaultButton(
                          text: "Adicionar ao Carrinho",
                          press: () {

                            carrinho = CartUtil.addOrUpdateCartItem(carrinho,Cart(product: widget.product, numOfItem: widget.quantidade));
                            Message.showSnackBar(context, 07);
                            NavigationHelper.navigateToCartScreen(context);

                            //Navigator.pop(context); // Voltar para a tela anterior
                            },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}