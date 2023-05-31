import 'package:flutter/material.dart';

import '../../../components/constant.dart';

class DefaultBackButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}