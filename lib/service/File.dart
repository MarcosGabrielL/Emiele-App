import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/config/environment.dart';
import '../models/files/FileDB.dart';

class FileService {
  final String baseUrl = Environment.baseUrl;
  final String baseUrlVendas = Environment.baseUrlVendas;
  FileService();

  Future<String> uploadSingleFile(File file, String id) async {
    final formData = http.MultipartFile.fromBytes('file', await file.readAsBytes(), filename: file.path);
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/uploadFile?idproduct=$id'))
      ..files.add(formData);

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to upload single file');
    }
  }

  Future<List> findAll() async {
    final response = await http.get(Uri.parse('$baseUrl/files'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => FileDB.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch file list');
    }
  }

  Future<List> findByIdProduto(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/filelist/produto/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => FileDB.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch file list by product ID');
    }
  }

  Future<List> findByIdVendedor(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/filelist/loja/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((item) => FileDB.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch file list by store ID');
    }
  }

  Future<Uint8List> findById(int id, String token) async {
    final response = await http.get(Uri.parse('$baseUrlVendas/file/$id'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch file by ID');
    }
  }


  Future<void> deleteById(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/file/delete/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete file by ID');
    }
  }

  Future<String> SalvaFotoLoja(File file, String id) async {
    final formData = http.MultipartFile.fromBytes('file', await file.readAsBytes(), filename: file.path);
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/loja/saveFile'))
      ..files.add(formData)
      ..fields['idproduct'] = id;

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to save store photo');
    }
  }

  Future<String> AtualizaFotoLoja(File file, String iddovendedor, String iddofile) async {
    final formData = http.MultipartFile.fromBytes('file', await file.readAsBytes(), filename: file.path);
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/loja/uploadFile'))
      ..files.add(formData)
      ..fields['idproduct'] = iddovendedor
      ..fields['id'] = iddofile;

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to update store photo');
    }
  }

  Future<List<FileDB>> findBannersByIdVendedor(dynamic id, String token) async {
    final String url = '$baseUrlVendas/filelist/banners/loja/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<FileDB>.from(data.map((jsonObject) => FileDB.fromJson(jsonObject)));
    } else {
      throw Exception('Failed to load banners');
    }
  }


}
