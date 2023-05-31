
import 'package:flutter/material.dart';

import '../../../../components/constant.dart';

class DefaultButton2 extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  const DefaultButton2({
    required this.btnText, required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextButton(
        onPressed: () {
          // Ação do botão
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: kLessPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text('Button'),
      ),
    );
  }
}