import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifyemailService {
  final String baseUrl;

  VerifyemailService(this.baseUrl);

  Future<String> sendEmail(Map<String, dynamic> request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sendingemail'),
      body: jsonEncode(request),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to send email');
    }
  }

  Future<bool> verifyEmail(String token, String email) async {
    final response = await http.get(
      Uri.parse('$baseUrl/confirm?token=$token&email=$email'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to verify email');
    }
  }

  void showMessage(String message) {
    print(message);

  }
}
