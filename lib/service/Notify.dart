import 'dart:convert'; // Importa a biblioteca 'dart:convert' para lidar com a codificação e decodificação de JSON.
import 'package:http/http.dart' as http; // Importa a biblioteca 'http' para fazer requisições HTTP.
import 'package:web_socket_channel/web_socket_channel.dart'; // Importa a biblioteca 'web_socket_channel' para comunicação por WebSocket.
import 'package:web_socket_channel/status.dart' as status; // Importa a biblioteca 'status' para lidar com os status do WebSocket.

class ChatService {
  final String baseUrl = 'https://jurisconexao-service-auth-production.up.railway.app'; // Define a URL base para as requisições e comunicação WebSocket.
  WebSocketChannel? _channel; // Canal de WebSocket para comunicação

  // Método para conectar ao WebSocket
  Future<void> connectWebSocket() async {
    final wsUrl = Uri.parse('$baseUrl/ws'); // Cria a URL para a conexão WebSocket.
    _channel = WebSocketChannel.connect(wsUrl); // Conecta ao servidor WebSocket e atribui o canal de comunicação à variável _channel.

    _channel!.stream.listen((message) {
      _channel!.sink.add('received!'); // Envia uma mensagem para o servidor WebSocket indicando que a mensagem foi recebida.
      //_channel!.sink.close(status.goingAway); // Fecha o canal de comunicação WebSocket.
    });
  }

  // Método para enviar uma mensagem
  Future<void> sendMessage(String message) async {
    final url = Uri.parse('$baseUrl/message'); // Cria a URL para enviar a mensagem.
    final response = await http.post(url, body: {'message': message}); // Envia uma requisição POST para a URL especificada, com a mensagem como corpo da requisição.

    if (response.statusCode == 200) {
      print('Message sent successfully'); // Imprime uma mensagem indicando que a mensagem foi enviada com sucesso, se a resposta da requisição for 200.
    } else {
      print('Failed to send message'); // Imprime uma mensagem indicando que houve falha no envio da mensagem, se a resposta da requisição não for 200.
    }
  }

  // Método para enviar uma mensagem privada
  Future<void> sendPrivateMessage(String receiverName, String message) async {
    final url = Uri.parse('$baseUrl/private-message'); // Cria a URL para enviar a mensagem privada.
    final body = jsonEncode({
      'receiverName': receiverName,
      'message': message,
    }); // Codifica os dados da mensagem em formato JSON.
    final response = await http.post(url, body: body); // Envia uma requisição POST para a URL especificada, com o corpo da requisição contendo os dados da mensagem codificados em JSON.

    if (response.statusCode == 200) {
      print('Private message sent successfully'); // Imprime uma mensagem indicando que a mensagem privada foi enviada com sucesso, se a resposta da requisição for 200.
    } else {
      print('Failed to send private message'); // Imprime uma mensagem indicando que houve falha no envio da mensagem privada, se a resposta da requisição não for 200.
    }
  }
}

/*connectWebSocket(): Este método deve ser usado para estabelecer a conexão com o servidor WebSocket. É responsável por criar o canal de comunicação WebSocket e definir um ouvinte para receber mensagens do servidor. É recomendado chamar esse método uma vez, no início da sessão ou quando for necessário estabelecer a conexão com o servidor WebSocket.

sendMessage(String message): Esse método é utilizado para enviar uma mensagem ao servidor através de uma requisição HTTP POST. É necessário passar a mensagem como argumento. Ele envia a mensagem para o endpoint "$baseUrl/message" e imprime "Message sent successfully" se a requisição for bem-sucedida (status code 200), caso contrário, imprime "Failed to send message". Esse método pode ser usado para enviar mensagens públicas para o chat.

sendPrivateMessage(String receiverName, String message): Esse método é usado para enviar uma mensagem privada para um destinatário específico. Recebe dois argumentos: receiverName, que é o nome do destinatário, e message, que é a mensagem a ser enviada. Ele envia a mensagem para o endpoint "$baseUrl/private-message" e imprime "Private message sent successfully" se a requisição for bem-sucedida (status code 200), caso contrário, imprime "Failed to send private message". Esse método pode ser usado para enviar mensagens privadas para um usuário específico.*/
