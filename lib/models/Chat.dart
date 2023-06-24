import 'message_model.dart';

class Chat {
  static const String SEQUENCE_NAME = "chat_sequence";

  int chatId;
  String firstUserName;
  String secondUserName;
  List<Message> messageList;

  Chat({
    required this.chatId,
    required this.firstUserName,
    required this.secondUserName,
    required this.messageList,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chatId'],
      firstUserName: json['firstUserName'],
      secondUserName: json['secondUserName'],
      messageList: List<Message>.from(json['messageList'].map((x) => Message.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'firstUserName': firstUserName,
      'secondUserName': secondUserName,
      'messageList': List<dynamic>.from(messageList.map((x) => x.toJson())),
    };
  }
}

