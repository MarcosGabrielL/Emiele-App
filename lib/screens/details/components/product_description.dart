import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/size_config.dart';
import '../../../components/constant.dart';
import '../../../models/Product.dart';

class ProductDescription extends StatelessWidget {

  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    Utf8Codec utf8codec = Utf8Codec();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: Text(
                product.codigo,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(80),
                decoration: BoxDecoration(
                  color: product.favorito ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "R\$\n" + product.precoun,
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
                  utf8codec.decode(utf8codec.encode(product.descricao)),
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}