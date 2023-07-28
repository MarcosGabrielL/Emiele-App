import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Message {
  static void showSnackBar(BuildContext context, int status) {
    String snackBarMessage;

    // Definir a mensagem do SnackBar com base no status
    switch (status) {
      case 200:
        snackBarMessage = 'Sucesso: OK';
        break;
      case 201:
        snackBarMessage = 'Criado: A solicitação foi bem-sucedida e um novo recurso foi criado como resultado';
        break;
      case 204:
        snackBarMessage = 'Sem Conteúdo: A solicitação foi bem-sucedida, mas não há conteúdo para enviar de volta';
        break;
      case 400:
        snackBarMessage = 'Requisição Inválida: A solicitação não pôde ser entendida pelo servidor devido à sintaxe inválida';
        break;
      case 01:
        snackBarMessage = 'A senha deve ter no mínimo 8 caracteres';
        break;
      case 02:
        snackBarMessage = 'Email inválido';
        break;
      case 03:
        snackBarMessage = 'Para prosseguir, é necessário que você concorde com os termos e condições.e';
        break;
      case 04:
        snackBarMessage = 'Enviamos um link de redefinição de senha para o seu e-mail. Por favor, verifique.';
        break;
      case 05:
        snackBarMessage ='Codigo de Verificação Invalido';
        break;
      case 06:
        snackBarMessage ='Sem detalhes Adicionais';
        break;
      case 07:
        snackBarMessage ='Produto Adicionado ao Carrinho com Sucesso';
        break;
      case 401:
        snackBarMessage = 'Não Autorizado: A solicitação requer autenticação do cliente ou as credenciais fornecidas não são válidas';
        break;
      case 403:
        snackBarMessage = 'Proibido: O servidor entendeu a solicitação, mas está se recusando a cumpri-la';
        break;
      case 404:
        snackBarMessage = 'Não Encontrado: O servidor não pôde encontrar o recurso solicitado';
        break;
      case 500:
        snackBarMessage = 'Erro do Servidor: O servidor encontrou uma situação inesperada que o impediu de cumprir a solicitação';
        break;
      default:
        snackBarMessage = 'Código de status desconhecido: ';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarMessage),

      ),
    );
  }
}

