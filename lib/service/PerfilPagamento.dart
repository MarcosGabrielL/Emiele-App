import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/Pagamento/AutenticacionResponse.dart';
import '../models/Pagamento/NewPreferenceDTO.dart';
import '../models/Pagamento/Perfil.dart';
import '../models/Pagamento/ResultPago.dart';
import '../models/Pagamento/Root.dart';
import '../models/Pagamento/RootDTO.dart';

class PerfilPagamentoService {
  final String baseUrl;
  final String baseUrlVendas;
  final String AppID;
  final String SECRET_KEY;
  final String accessToken;

  PerfilPagamentoService({
    required this.baseUrl,
    required this.baseUrlVendas,
    required this.AppID,
    required this.SECRET_KEY,
    required this.accessToken,
  });

  Future<Perfil> getById(String id) async {
    final url = '$baseUrl/perfispagamento/perfil/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Perfil.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  Future<Perfil> getByIdVendedor(String email) async {
    final url = '$baseUrl/perfispagamento/perfil/user/$email';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Perfil.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  void mensagem(String str) {
    print(str);
    // SnackBar implementation in Flutter
  }

  void mensagemsucess(String str) {
    print(str);
    // SnackBar implementation in Flutter
  }

  void mensagemerro(String str) {
    print(str);
    // SnackBar implementation in Flutter
  }

  Future<Perfil> save(Perfil vendedor, dynamic token) async {
    final url = '$baseUrl/perfispagamento/perfil/add?token=$token';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(vendedor.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Perfil.fromJson(jsonData);
    } else {
      throw Exception('Failed to save profile');
    }
  }

  Future<Perfil> atualizaVendedor(Perfil vendedor, dynamic token, dynamic id) async {
    final url = '$baseUrl/perfispagamento/perfil/update/$id?token=$token';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(vendedor.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Perfil.fromJson(jsonData);
    } else {
      throw Exception('Failed to update profile');
    }
  }

  Future<Root> createPreference(NewPreferenceDTO newPreferenceDTO) async {
    final url = '$baseUrlVendas/create';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(newPreferenceDTO.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Root.fromJson(jsonData);
    } else {
      throw Exception('Failed to create preference');
    }
  }

  Future<Root> createPreferenceVendedor(NewPreferenceDTO newPreferenceDTO, dynamic id) async {
    final url = '$baseUrlVendas/create/Vendedor?id=$id';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(newPreferenceDTO.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Root.fromJson(jsonData);
    } else {
      throw Exception('Failed to create preference for vendor');
    }
  }

  Future<RootDTO> savePreference(RootDTO newPreference, dynamic token) async {
    final url = '$baseUrlVendas/preferences/preference/add?token=$token';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(newPreference.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return RootDTO.fromJson(jsonData);
    } else {
      throw Exception('Failed to save preference');
    }
  }

  Future<ResultPago> getResultpagos(String id, dynamic token) async {
    final url = '$baseUrlVendas/resultpagos/resultpago/user/$id?token=$token';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ResultPago.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch result payments');
    }
  }

  Future<AutenticacionResponse> enviaCredenciais1(dynamic code) async {
    final url = 'https://api.mercadopago.com/oauth/token';
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $accessToken',
    };
    final body = {
      'grant_type': 'authorization_code',
      'client_id': AppID.toString(),
      'client_secret': SECRET_KEY.toString(),
      'code': code.toString(),
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AutenticacionResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to send credentials');
    }
  }

  Future<AutenticacionResponse> enviaCredenciais(dynamic code) async {
    final url = 'https://api.mercadolibre.com/oauth/token';
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {
      'grant_type': 'authorization_code',
      'client_id': AppID.toString(),
      'client_secret': SECRET_KEY.toString(),
      'code': code.toString(),
      'redirect_uri': 'https://emiele-service-gerenciador.herokuapp.com/generic/oauth',
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AutenticacionResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to send credentials');
    }
  }

  Future<AutenticacionResponse> salvaCredenciais(AutenticacionResponse autenticacionResponse, dynamic id) async {
    final url = '$baseUrlVendas/create/add?id=$id';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(autenticacionResponse.toJson());

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AutenticacionResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to save credentials');
    }
  }

  Future<AutenticacionResponse> getCredenciais(String id, dynamic token) async {
    final url = '$baseUrlVendas/auth/$id?token=$token';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AutenticacionResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch credentials');
    }
  }
}
