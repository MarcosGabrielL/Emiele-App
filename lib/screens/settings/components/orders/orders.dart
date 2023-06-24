
import 'package:flutter/material.dart';

import '../../../../components/constant.dart';
import '../../../../widgets/emptySection.dart';
import '../../../notification/components/defaultAppBar.dart';
import '../../../notification/components/defaultBackButton.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'My Orders',
        child: DefaultBackButton(),
      ),
      body: EmptySection(
        emptyImg: emptyOrders,
        emptyMsg: 'No orders yet',
      ),
    );
  }
}