import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Chat.dart';
import '../models/message_model.dart';

class ChatService {
  final String baseUrl = "http://localhost:8080";

  // Atualiza um chat com uma nova mensagem
  Future<http.Response> updateChat(Message message, dynamic chatId) {
    final url = Uri.parse(baseUrl + "/chats/message/" + "$chatId");
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(message);

    return http.put(url, headers: headers, body: body);
  }

  // Obtém um chat pelo ID
  Future<Chat> getChatById(dynamic chatId) {
    final url = Uri.parse(baseUrl + "/chats/" + chatId.toString());

    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return Chat.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load chat');
      }
    });
  }

  // Cria uma nova sala de chat
  Future<http.Response> createChatRoom(Chat chat) {
    final url = Uri.parse(baseUrl + "/chats/add");
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(chat);

    return http.post(url, headers: headers, body: body);
  }

  // Obtém um chat pelo nome de usuário do primeiro e segundo usuário
  Future<Chat> getChatByFirstUserNameAndSecondUserName(
      String firstUserName, String secondUserName) {
    final url = Uri.parse(baseUrl +
        "/chats/getChatByFirstUserNameAndSecondUserName" +
        '?firstUserName=' +
        firstUserName +
        '&secondUserName=' +
        secondUserName);

    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return Chat.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load chat');
      }
    });
  }

  // Obtém um chat pelo nome de usuário do primeiro ou segundo usuário
  Future<Chat> getChatByFirstUserNameOrSecondUserName(dynamic username) {
    final url =
    Uri.parse(baseUrl + "/chats/getChatByFirstUserNameOrSecondUserName/" + username.toString());

    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return Chat.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load chat');
      }
    });
  }
}
