import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/Cor.dart';
import '../../../models/files/FileDB.dart';
import '../environment.dart';

// Assuming you have the necessary models CorModel and FileDB

class ConfigService {
  final String baseUrl = Environment.baseUrl;
  final String baseUrlConfig = Environment.baseUrlConfig;


  Future<List<CorModel>> findColorsByIdVendedor(int idVendedor, String token) async {
    final url = '${baseUrlConfig}/cores/Cor/usuario/$idVendedor?token=$token';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CorModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load colors');
    }
  }

  Future<List> findBannersByIdVendedor(int id, String token) async {
    final url = '${baseUrl}/filelist/banners/loja/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => FileDB.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
