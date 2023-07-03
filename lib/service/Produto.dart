import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Venda/Produto.dart';
import '../models/Venda/ProdutoDTO.dart';


class ProdutoService {
  final String baseUrl;

  ProdutoService(this.baseUrl);

  Future<List> findAll() async {
    final response = await http.get(Uri.parse('$baseUrl/produtos'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => Produto.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<Produto> findById(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produto?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Produto.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch product by ID');
    }
  }

  Future<List> findByIdVendedor(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produto/byvendedor?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => Produto.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products by vendor ID');
    }
  }

  Future<Produto> create(Produto produto, String token, String vendedorid) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produtos/produto/add?token=$token&vendedorid=$vendedorid'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produto.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Produto.fromJson(jsonData);
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<void> delete(String id, String token) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id?token=$token'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product by ID');
    }
  }

  Future<void> update(Produto produto, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/produto/update/id=${produto.id}&token=$token'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produto.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  Future<List> findDTOByIdVendedor(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produtodto/byvendedor?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => ProdutoDTO.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch product DTOs by vendor ID');
    }
  }

  void mensagem(String str, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(str),
        duration: const Duration(milliseconds: 4000),
      ),
    );
  }

}
