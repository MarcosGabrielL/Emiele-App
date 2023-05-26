import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jurisconexao_cliente/models/auth_request_auth.dart';
import 'package:jurisconexao_cliente/models/auth_request_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'https://jurisconexao-service-auth-production.up.railway.app';
  final String isLoggedInKey = 'isLoggedIn';
  final String loggedUser = 'LoggedUser';
  late SharedPreferences _preferences;

  bool isLoggedIn = false;
  String user = '';

  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
    isLoggedIn = _preferences.getBool(isLoggedInKey) ?? false;
    user = _preferences.getString(loggedUser) ?? "";
  }
  Future<bool> checkLoginStatus() async {
    _preferences = await SharedPreferences.getInstance();

    //Teste para login
    /* _preferences.setBool(isLoggedInKey, false);
     _preferences.setString(loggedUser,"");*/

    return _preferences.getBool(isLoggedInKey) ?? false;
  }

  Future<String> authenticate(String email, String password) async {
    final url = Uri.parse('$baseUrl/authenticate');
    final body = json.encode({'email': email, 'password': password});

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      final responseData = json.encode(response.body);
      if (response.statusCode == 200) {
       // print('Authenticate response: $responseData');
        SharedPreferences _preferences = await SharedPreferences.getInstance();
        isLoggedIn = true;
        await _preferences.setBool(isLoggedInKey, true);
        return responseData;
      } else {
        print('1: authenticate failed: $responseData');
        throw Exception('Registration failed');
      }
    } catch (e) {
      print('1: authenticate failed: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<String> signUp(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/process_register');
    final body = json.encode({
      "email": email,
      "password": password,
      "firstName": "",
      "lastName": "",
      "tipo": "3"
    });

      try {
        final response = await http.post(
            url,
            body: body,
            headers: {
          'Content-Type': 'application/json',
        });



        if (response.statusCode == 201 || response.statusCode == 200) {
          final responseData = json.encode(response.body);
          //print('Registration response: $responseData');
          isLoggedIn = true;

          SharedPreferences _preferences = await SharedPreferences.getInstance();

          await _preferences.setBool(isLoggedInKey, true);
          await _preferences.setString(loggedUser, email);

          return  responseData;
        } else {
          final responseData = json.decode(response.body);
          print('2: Registration failed: $responseData');
          throw Exception('Registration failed');
        }
      } catch (e) {
        print('2: Registration failed: $e');
        throw Exception('Failed to connect to the server: $e');
      }
  }

  void logout() {
    // Lógica de logout aqui
    // Defina isLoggedIn como false
    isLoggedIn = false;
    _preferences.setBool(isLoggedInKey, false);
  }
}


