import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/config/environment.dart';
import '../models/Venda/ProdutoDTO.dart';


class ProdutoService {
  final String baseUrl = Environment.baseUrlVendas;

  ProdutoService();

  Future<List> findAll() async {
    final response = await http.get(Uri.parse('$baseUrl/produtos'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => ProdutoDTO.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<ProdutoDTO> findById(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produto?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProdutoDTO.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch product by ID');
    }
  }

  Future<List> findByIdVendedor(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produto/byvendedor?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => ProdutoDTO.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products by vendor ID');
    }
  }

  Future<ProdutoDTO> create(ProdutoDTO produto, String token, String vendedorid) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produtos/produto/add?token=$token&vendedorid=$vendedorid'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produto.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProdutoDTO.fromJson(jsonData);
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

  Future<void> update(ProdutoDTO produto, String token) async {
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

  Future<List<ProdutoDTO>> findProdutosByIdVendedor(int id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/produtodto/byvendedor?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      print(data);
      return data.map((json) => ProdutoDTO.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to fetch products by vendor ID');
    }
  }

  Future<List<ProdutoDTO>> findProdutosDestaquesByIdVendedor(int id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/destaque/produtodto/byvendedor?id=$id&token=$token'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

      return data.map((json) => ProdutoDTO.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to fetch products by vendor ID');
    }
  }
}
