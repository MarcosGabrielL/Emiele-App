class Produto {
  String id;
  String codigo;
  String descricao;
  double precoun;
  int quantidade;
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

  static fromJson(item) {}

  Object? toJson() {}
}
