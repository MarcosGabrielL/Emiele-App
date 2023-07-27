import 'Cores.dart';

class Product {
  int id;
  String codigo;
  String descricao;
  String precoun;
  double quantidade;
  String tipo;
  String data;
  String loja;
  String vendedorId;
  List<String> urls;
  List<Cores> cores;
  bool favorito;
  bool destaque;

  Product({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.precoun,
    required this.quantidade,
    required this.tipo,
    required this.data,
    required this.loja,
    required this.vendedorId,
    required this.urls,
    required this.cores,
    required this.favorito,
    required this.destaque,
  });

  // Método para criar uma instância de Product a partir de um mapa (JSON)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      codigo: json['codigo'],
      descricao: json['descricao'],
      precoun: json['precoun'],
      quantidade: json['quantidade'].toDouble(),
      tipo: json['tipo'],
      data: json['data'],
      loja: json['loja'],
      vendedorId: json['vendedor_id'],
      urls: json['urls'] != null ? List<String>.from(json['urls']) : [],
      cores: json['cores'] != null
          ? List<Cores>.from(json['cores'].map((color) => Cores.fromJson(color)))
          : [],
      favorito: json['favorito'] ?? false,
      destaque: json['destaque'] ?? false,
    );
  }

  // Método para converter a instância de Product em um mapa (JSON)
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
      'vendedor_id': vendedorId,
      'cores': cores.map((color) => color.toJson()).toList(),
      'favorito': favorito,
      'destaque': destaque,
      'urls': urls,
    };
  }
}
