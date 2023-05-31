
import 'package:flutter/material.dart';

import '../../../../components/constant.dart';
import '../../../../widgets/emptySection.dart';
import '../../../../widgets/subTitle.dart';
import '../../../notification/components/defaultAppBar.dart';
import '../../../notification/components/defaultBackButton.dart';
import '../payment/defaultButton.dart';

class CallCenter extends StatefulWidget {

  @override
  _CallCenterState createState() => _CallCenterState();
}

class _CallCenterState extends State<CallCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Call Center",
        child: DefaultBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: callCenter,
            emptyMsg: "We're happy to help you!",
          ),
          SubTitle(
            subTitleText: "If you have complain about the product chat me",
          ),
          DefaultButton2(
            btnText: "Chat Me",
            onPressed: () => {}
          )
        ],
      ),
    );
  }
}