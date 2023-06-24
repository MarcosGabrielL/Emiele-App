import 'package:flutter/material.dart';

import '../components/constant.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({

    required this.subTitleText,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kFixPadding),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: kSubTextStyle,
      ),
    );
  }
}