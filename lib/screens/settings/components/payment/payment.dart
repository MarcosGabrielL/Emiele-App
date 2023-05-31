
import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/screens/settings/components/payment/success.dart';

import '../../../../components/constant.dart';
import '../../../../widgets/headerLabel.dart';
import '../../../notification/components/defaultAppBar.dart';
import '../../../notification/components/defaultBackButton.dart';
import 'defaultButton.dart';

class Payment extends StatefulWidget {

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Payment',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = index),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          DefaultButton2(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}