import 'package:flutter/material.dart';

import '../components/constant.dart';

class StickyLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  const StickyLabel({

    required this.text,
    required this.textColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        top: kFixPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}