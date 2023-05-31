import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/bottombar.dart';
import 'package:jurisconexao_cliente/models/message_model.dart';
import 'package:jurisconexao_cliente/models/user_model.dart';
import 'package:jurisconexao_cliente/widgets/filters.dart';

import '../components/util/date.dart';

class ChatScreen extends StatefulWidget {
  final User user;


  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isOptionsVisible = true;

  List<Message> solicitacoes1 = [

    Message(
      sender: currentUser,
      time: DataUtil.getFormattedTime(),
      text: 'Just walked my doge. She was super duper cute. The best pupper!!',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: greg,
      time: '11:30 AM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: false,
    ),

  ];

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Colors.white : Colors.white,
        borderRadius: isMe
            ? BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        )
            : BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            message.time,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.archive_outlined),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Mande sua Duvida...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildFilterSelection() {
    return AnimatedOpacity(
      opacity: isOptionsVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                setState(() {
                  isOptionsVisible = !isOptionsVisible;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('SlideButton'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,

        title: Text(
         '',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white), // Define a cor da seta de volta

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
           Filters(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: solicitacoes1.length, //messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = solicitacoes1[index];
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
      ),
      //  bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}



