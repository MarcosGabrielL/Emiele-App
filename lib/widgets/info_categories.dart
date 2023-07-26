import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/constant.dart';

import '../../../components/config/size_config.dart';

class CategoriesGuield extends StatelessWidget {
  const CategoriesGuield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: kPrimaryColor),
          children: [
            TextSpan(text: kTitulo + " 🤩\n"), //"Cupom "),
            TextSpan(
              text: kSubTitulo, //"Cupom a partir de R\$5",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}