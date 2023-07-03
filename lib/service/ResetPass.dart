import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetpasswordService {
  final String baseUrl;

  ResetpasswordService(this.baseUrl);

  Future<String> processForgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/forgot_password?email=$email'),
      body: email,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to process forgot password');
    }
  }

  Future<String> processResetPassword(
      String token, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          '$baseUrl/reset_password?email=$email&token=$token&password=$password'),
      body: email,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to process reset password');
    }
  }

  void showMessage(String message) {
    print(message);
    
  }
}
