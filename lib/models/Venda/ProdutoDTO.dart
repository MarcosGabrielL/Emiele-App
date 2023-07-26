import 'package:jurisconexao_cliente/models/files/FileDB.dart';

class ProdutoDTO {
  int id;
  String codigo;
  String descricao;
  String precoun;
  double quantidade;
  String tipo;
  String data;
  String loja;
  String vendedor_id;
  List<String> urls;

  ProdutoDTO({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.precoun,
    required this.quantidade,
    required this.tipo,
    required this.data,
    required this.loja,
    required this.vendedor_id,
    required this.urls,
  });

  // Convert ProdutoDTO object to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'descricao': descricao,
      'precoun': precoun,
      'quantidade': quantidade,
      'tipo': tipo,
      'data': data,
      'loja': loja,
      'vendedor_id': vendedor_id,
      'urls': urls,
    };
  }

  // Create ProdutoDTO object from a Map (JSON)
  factory ProdutoDTO.fromJson(Map<String, dynamic> json) {
    return ProdutoDTO(
      id: json['id'],
      codigo: json['codigo'],
      descricao: json['descricao'],
      precoun: json['precoun'],
      quantidade: json['quantidade'],
      tipo: json['tipo'],
      data: json['data'],
      loja: json['loja'],
      vendedor_id: json['vendedor_id'],
      urls: (json['urls'] as List<dynamic>).map((url) => url.toString()).toList(),
    );
  }

  @override
  String toString() {
    return 'ProdutoDTO(id: $id, codigo: $codigo, descricao: $descricao, precoun: $precoun, quantidade: $quantidade, tipo: $tipo, data: $data, loja: $loja, vendedor_id: $vendedor_id, urls: $urls)';
  }
}
