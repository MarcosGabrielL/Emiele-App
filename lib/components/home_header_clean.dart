import 'package:flutter/material.dart';

import '../../../components/config/size_config.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/components/icon_btn_with_counter.dart';
import '../screens/home/components/search_field.dart';
import '../screens/notification/components/defaultBackButton.dart';

class HomeHeaderClean extends StatelessWidget {
  const HomeHeaderClean({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultBackButton(),

          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}