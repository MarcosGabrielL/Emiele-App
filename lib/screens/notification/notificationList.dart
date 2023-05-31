
import '../../components/constant.dart';
import 'components/defaultAppBar.dart';
import 'components/defaultBackButton.dart';
import 'package:flutter/material.dart';
import 'components/notificationTiles.dart';
import 'notificationPage.dart';

class NotificationList extends StatefulWidget {

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: '',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'E-Commerce',
              subtitle: 'Thanks for download E-Commerce app.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}