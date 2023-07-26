import 'package:flutter/material.dart';

import '../../components/config/service/Config.dart';
import '../../components/config/environment.dart';
import '../../components/config/size_config.dart';
import '../../components/constant.dart';

class CircularProgress extends StatelessWidget {
  static String routeName = "/splash";


  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);

      return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[


            ],
          ),
        ),
      );

  }



}