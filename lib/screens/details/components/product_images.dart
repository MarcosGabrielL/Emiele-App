import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../components/config/size_config.dart';
import '../../../components/constant.dart';
import '../../../models/Product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(228),
          child: AspectRatio(
            aspectRatio: 1, // Mantém a proporção quadrada
            child: Hero(
              tag: widget.product.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Arredonda os cantos
                child: Image.memory(
                  Uint8List.fromList(Base64Decoder().convert(widget.product.urls[selectedImage])),
                  fit: BoxFit.cover, // Faz a imagem ocupar todo o espaço do ClipRRect
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: getProportionateScreenWidth(10)),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.urls.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.memory(Uint8List.fromList(Base64Decoder().convert(widget.product.urls[index]))),
      ),
    );
  }
}