import 'package:flutter/material.dart';

import '../../../../../components/constant.dart';

class DescSection extends StatelessWidget {
  final String text;
  const DescSection({
    required this.text,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kLessPadding, horizontal: kFixPadding),
      child:
      Text(text, style: kSubTextStyle),
    );
  }
}