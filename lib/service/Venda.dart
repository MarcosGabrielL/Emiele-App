import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/Venda/Evento.dart';
import '../models/Venda/Frete.dart';
import '../models/Venda/RequestWrapper.dart';
import '../models/Venda/ResponseVendas.dart';
import '../models/Venda/Venda.dart';
import '../models/Venda/Produto.dart';
import '../components/config/environment.dart';

class VendaService {
  final String baseUrl = Environment.baseUrlVendas;

  Future<List> getAll() async {
    final url = '$baseUrl/vendas';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Venda.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vendas');
    }
  }

  Future<Venda> getVendaById(String id, String token) async {
    final url = '$baseUrl/vendas/venda/$id?id=$id&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Venda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load venda');
    }
  }

  Future<List> findAllByIdComprador(String id, String token) async {
    final url = '$baseUrl/vendas/venda/comprador?id=$id&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Venda.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vendas');
    }
  }

  Future<Venda> addVendas(RequestWrapper requestWrapper, String token) async {
    final url = '$baseUrl/vendas/venda/?token=$token';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestWrapper.toJson()),
    );
    if (response.statusCode == 200) {
      return Venda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add venda');
    }
  }

  Future<Venda> attVendas(String token, Venda venda) async {
    final url = '$baseUrl/vendas/venda/att?token=$token';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(venda.toJson()),
    );
    if (response.statusCode == 200) {
      return Venda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update venda');
    }
  }

  Future<Venda> updateVendas(String id, String token, Venda venda) async {
    final url = '$baseUrl/vendas/venda/update/$id?id=$id&token=$token';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(venda.toJson()),
    );
    if (response.statusCode == 200) {
      return Venda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update venda');
    }
  }

  Future<Venda> addVendascancel(String id, String token) async {
    final url = '$baseUrl/vendas/venda/cancela?id=$id&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Venda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to cancel venda');
    }
  }

  Future<void> deleteVendas(String id, String token) async {
    final url = '$baseUrl/vendas/delete/$id?token=$token';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete venda');
    }
  }

  Future<List> findAllByDataSaida(String idvendedor, String token) async {
    final url = '$baseUrl/vendas/venda/hoje?idvendedor=$idvendedor&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Venda.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vendas');
    }
  }

  Future<List> findAllByDia(String data, String idvendedor, String token) async {
    final url = '$baseUrl/vendas/venda/dia?idvendedor=$idvendedor&token=$token&data=$data';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Venda.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vendas');
    }
  }

  Future<Future<ResponseVendas>?> findTotalToday(String idvendedor, String token) async {
    final url = '$baseUrl/vendas/hoje?idvendedor=$idvendedor&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResponseVendas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load total today');
    }
  }

  Future<Future<ResponseVendas>?> findTotalDay(String data, String idvendedor, String token) async {
    final url = '$baseUrl/vendas/dia?idvendedor=$idvendedor&token=$token&data=$data';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResponseVendas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load total day');
    }
  }

  Future<Future<ResponseVendas>?> findTotalMes(String idvendedor, String token) async {
    final url = '$baseUrl/vendas/mes?idvendedor=$idvendedor&token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResponseVendas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load total mes');
    }
  }

  Future<List> findEventos(String idvendedor, String token) async {
    final url = '$baseUrl/eventos/evento/usuario/$idvendedor?token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Evento.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load eventos');
    }
  }

  void mensagem(String str) {

  }



  Future<String> getTempoDecorrido(dynamic horacomentad) async {
    final url = '$baseUrl/util/TempoDecorrido/$horacomentad';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get tempo decorrido');
    }
  }

  Future<List> findAllVendidosByIdVenda(String idvenda, String token) async {
    final url = '$baseUrl/vendidos/vendidos/vendido/venda/$idvenda?token=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Produto.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vendidos');
    }
  }

}
