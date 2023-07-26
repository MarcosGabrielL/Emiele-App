

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../components/config/size_config.dart';
import '../components/constant.dart';

class PopularSearchs extends StatelessWidget {
  const PopularSearchs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: getProportionateScreenWidth(40)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

          children: List.generate(
            ProdutosDestacados.length,
                (i) => SpecialOfferCard(
                file: Uint8List.fromList(Base64Decoder().convert(ProdutosDestacados[i].urls[0])),
                category: ProdutosDestacados[i].descricao,
                numOfBrands: ProdutosDestacados[i].precoun,
                press: () {},
              ),
          ),


          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.file,
    required this.category,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category;
  final String numOfBrands;
  final GestureTapCallback press;
  final Uint8List file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(130),
          height: getProportionateScreenWidth(130),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                ClipRect(
                  child: Image.memory(
                    file,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: category+"\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "R\$"+numOfBrands)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
