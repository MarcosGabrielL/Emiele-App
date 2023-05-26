import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jurisconexao_cliente/models/auth_request_auth.dart';
import 'package:jurisconexao_cliente/models/auth_request_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://jurisconexao-service-auth-production.up.railway.app';
  final String isLoggedInKey = 'isLoggedIn';
  late SharedPreferences _preferences;

  bool isLoggedIn = false;

  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
    isLoggedIn = _preferences.getBool(isLoggedInKey) ?? false;
  }
  Future<bool> checkLoginStatus() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool(isLoggedInKey) ?? false;
  }

  Future<AuthModel> authenticate(String email, String password) async {
    final url = Uri.parse('$baseUrl/authenticate');
    final body = json.encode({'email': email, 'password': password});

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        isLoggedIn = true;
        await _preferences.setBool(isLoggedInKey, true);
        return AuthModel.fromJson(responseData);
      } else {
        throw Exception('Authentication failed');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<RegisterModel> signUp(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final body = json.encode({
      'name': name,
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return RegisterModel.fromJson(responseData);
      } else {
        throw Exception('Registration failed');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  void logout() {
    // Lógica de logout aqui
    // Defina isLoggedIn como false
    isLoggedIn = false;
    _preferences.setBool(isLoggedInKey, false);
  }
}


