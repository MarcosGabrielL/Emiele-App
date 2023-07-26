class Produto {
  int id;
  String codigo;
  String descricao;
  String precoun;
  double quantidade;
  String tipo;
  String unidade;
  String data;
  String vendedorId;

  Produto({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.precoun,
    required this.quantidade,
    required this.tipo,
    required  this.unidade,
    required  this.data,
    required  this.vendedorId,
  });

  // Convert Produto object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'descricao': descricao,
      'precoun': precoun,
      'quantidade': quantidade,
      'tipo': tipo,
      'unidade': unidade,
      'data': data,
      'vendedorId': vendedorId,
    };
  }

  // Create a Produto object from a JSON representation
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      codigo: json['codigo'],
      descricao: json['descricao'],
      precoun: json['precoun'],
      quantidade: json['quantidade'],
      tipo: json['tipo'],
      unidade: json['unidade'],
      data: json['data'],
      vendedorId: json['vendedorId'],
    );
  }

  // Convert Produto object to a string representation
  @override
  String toString() {
    return 'Produto(id: $id, codigo: $codigo, descricao: $descricao, precoun: $precoun, '
        'quantidade: $quantidade, tipo: $tipo, unidade: $unidade, data: $data, vendedorId: $vendedorId)';
  }

}
