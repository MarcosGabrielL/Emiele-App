import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../pages/new_solicitation.dart';
import '../screens/chat_screen.dart';
import '../widgets/new_chat.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(user: currentUser,)),
        );
      },
      tooltip: 'Increment',
      child: Icon(Icons.question_mark, size: 35.0, color: Colors.deepOrangeAccent.shade100,),
      elevation: 1.0,
      backgroundColor: Colors.grey.shade200, // Defina a cor de fundo aqui
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
      ),
    );
  }
}
