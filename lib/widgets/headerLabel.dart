import 'package:flutter/material.dart';

import '../components/constant.dart';

class HeaderLabel extends StatelessWidget {
  final String headerText;
  const HeaderLabel({
   required this.headerText,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text(
        headerText,
        style: TextStyle(color: kLightColor, fontSize: 28.0),
      ),
    );
  }
}