import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/models/message_model.dart';
import 'package:jurisconexao_cliente/screens/chat_screen.dart';


class Filters extends StatelessWidget {

  double hightFiltres = 5.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
          children: <Widget>[
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Filtros',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    ),
    Column(
    children: <Widget>[
    Filters(),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
    ),
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
    ),
    child: ListView.builder(
    reverse: true,
    padding: EdgeInsets.only(top: 15.0),
    itemCount: messages.length,
    itemBuilder: (BuildContext context, int index) {
    final Message message = messages[index];
    final bool isMe = message.sender.id == currentUser.id;
    return _buildMessage(message, isMe);
    },
    ),
    ),
    ),
    ),
    _buildMessageComposer(),
    ],
    ),
    );
    }
}
