
import 'package:flutter/material.dart';

import '../../../../components/bottomnavigate_bar.dart';
import '../../../../components/constant.dart';
import '../../../../widgets/emptySection.dart';
import '../../../../widgets/subTitle.dart';
import 'defaultButton.dart';

class Success extends StatefulWidget {

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          DefaultButton2(
            btnText: 'Ok',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  CustomBottomAppBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}