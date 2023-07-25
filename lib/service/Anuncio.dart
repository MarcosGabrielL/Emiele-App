import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/Cor.dart';
import '../../../models/files/FileDB.dart';
import '../components/config/environment.dart';
import '../models/Anuncio.dart';

// Assuming you have the necessary models CorModel and FileDB

class AnuncioService {
  final String baseUrl = Environment.baseUrl;
  final String baseUrlConfig = Environment.baseUrlConfig;


  Future<List<Anuncio>> findAnuncioByIdVendedor(int idVendedor, String token) async {
    final url = '${baseUrlConfig}/anuncios/Anuncio/usuario/$idVendedor?token=$token';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Anuncio.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load colors');
    }
  }


}
