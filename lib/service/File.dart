import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/files/FileDB.dart';

class FileService {
  final String baseUrl;

  FileService(this.baseUrl);

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

  Future<FileDB> findById(String id, String token) async {
    final response = await http.get(Uri.parse('$baseUrl/file/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return FileDB.fromJson(jsonData);
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
}
