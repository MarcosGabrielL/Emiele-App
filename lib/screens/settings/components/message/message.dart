
import 'package:flutter/material.dart';

import '../../../../components/constant.dart';
import '../../../../widgets/emptySection.dart';
import '../../../notification/components/defaultAppBar.dart';
import '../../../notification/components/defaultBackButton.dart';

class Message_config extends StatefulWidget {

  @override
  _Message_configState createState() => _Message_configState();
}

class _Message_configState extends State<Message_config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Message',
        child: DefaultBackButton(),
      ),
      body: EmptySection(
        emptyImg: chatBubble,
        emptyMsg: 'No message yet',
      ),
    );
  }
}