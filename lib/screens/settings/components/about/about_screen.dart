
import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/screens/notification/components/defaultBackButton.dart';

import '../../../../components/constant.dart';
import '../../../home/components/home_header.dart';
import '../../../notification/components/defaultAppBar.dart';
import 'components/descSection.dart';

class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'About Application',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          HomeHeader(),
          Divider(),
          DescSection(
            text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          ),
          DescSection(
            text:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
          ),
        ],
      ),
    );
  }
}