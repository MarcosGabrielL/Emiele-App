import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jurisconexao_cliente/models/auth_request_auth.dart';
import 'package:jurisconexao_cliente/models/auth_request_register.dart';
import 'package:jurisconexao_cliente/service/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';

class AuthService {
  final String baseUrl =
      'https://jurisconexao-service-auth-production.up.railway.app';
  final String isLoggedInKey = 'isLoggedIn';
  final String loggedUser = 'LoggedUser';
  final String isFirstTimeKey = 'isFirstTime';
  final String PhoneKey = 'phone';
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

    /**
     * Teste para entrada sem registro
     */
    //await _preferences.setBool(isLoggedInKey, true);

    /**
     * Teste para remover Registro
     */
    /* _preferences.setBool(isLoggedInKey, false);
     _preferences.setString(loggedUser,"");*/

    return _preferences.getBool(isLoggedInKey) ?? false;
  }

  Future<String> authenticate(
      BuildContext context, String email, String password) async {
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
        await _preferences.setString(loggedUser,email);

        Message.showSnackBar(context, response.statusCode);

        return responseData;
      } else {
        Message.showSnackBar(context, response.statusCode);
        print('1: authenticate failed: $responseData');
        throw Exception('Registration failed');
      }
    } catch (e) {
      Message.showSnackBar(context, 500);
      print('1: authenticate failed: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<String> signUp(
      BuildContext context, String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/process_register');
    final body = json.encode({
      "email": email,
      "password": password,
      "firstName": name,
      "lastName": "",
      "tipo": "3",
      "instancia": "1"
    });

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseData = json.encode(response.body);
        //print('Registration response: $responseData');
        isLoggedIn = true;

        SharedPreferences _preferences = await SharedPreferences.getInstance();

        await _preferences.setBool(isLoggedInKey, true);
        await _preferences.setString(loggedUser, email);
        await _preferences.setString(PhoneKey, name);

        Message.showSnackBar(context, response.statusCode);
        return responseData;
      } else {
        final responseData = json.decode(response.body);
        Message.showSnackBar(context, response.statusCode);
        print('2: Registration failed: $responseData');
        throw Exception('Registration failed');
      }
    } catch (e) {
      Message.showSnackBar(context, 500);
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

  Future<bool> checkisFirstTimeStatus() async {
    _preferences = await SharedPreferences.getInstance();

    /**Teste para login **/
    // _preferences.setBool(isFirstTimeKey, true);


    return _preferences.getBool(isFirstTimeKey) ?? true;
  }

   void set_isFirstTimeStatus() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool(isFirstTimeKey, false);
  }

  Future<String> forgotPass(BuildContext context, String email) async {
    final url = Uri.parse('$baseUrl/forgot_password/');
    final body = {'email': email}; // Não precisa codificar para JSON usando json.encode()

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      final responseData = response.body;
      print('Recuperar Senha: $responseData');

      SharedPreferences _preferences = await SharedPreferences.getInstance();
      bool isLoggedIn = true;
      await _preferences.setBool('isLoggedInKey', isLoggedIn);

      Message.showSnackBar(context, response.statusCode);

      return responseData;
    } catch (e) {
      Message.showSnackBar(context, 500);
      print('1: authenticate failed: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<String> reSendEmailCode(BuildContext context, String email) async {
    final url = Uri.parse('$baseUrl/send_email');
    final body = {'email': email}; // Não precisa codificar para JSON usando json.encode()

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      final responseData = response.body;
      print('Recuperar Senha: $responseData');

      SharedPreferences _preferences = await SharedPreferences.getInstance();
      bool isLoggedIn = true;
      await _preferences.setBool('isLoggedInKey', isLoggedIn);

      Message.showSnackBar(context, response.statusCode);

      return responseData;
    } catch (e) {
      Message.showSnackBar(context, 500);
      print('1: authenticate failed: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<bool> isCodeValid(BuildContext context, String email, String code) async {
    final url = Uri.parse('$baseUrl/checkRegistrationCode');
    final body = {'email': email, 'code':code};

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      final responseData = response.body;
      print('Registration Code: $responseData');

      SharedPreferences _preferences = await SharedPreferences.getInstance();
      bool isLoggedIn = response.statusCode == 200; // Verifica se o status é 200
      await _preferences.setBool('isLoggedInKey', isLoggedIn);

      Message.showSnackBar(context, response.statusCode);

      return isLoggedIn;
    } catch (e) {
      Message.showSnackBar(context, 500);
      print('1: authenticate failed: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<UserModel> getUserByEmail(String email) async {
    final String endpoint = "/user/$email";
    final Uri uri = Uri.parse(baseUrl + endpoint);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return UserModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


}
