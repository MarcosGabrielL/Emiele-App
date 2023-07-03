class ProdutoDTO {
  String id;
  String codigo;
  String descricao;
  String precoun;
  String ventrada;
  int quantidade;
  String tipo;
  String unidade;
  String unidadeTributavel;
  String data;
  String loja;
  double subTotal;
  String vendedorId;
  List<String> urls;

  ProdutoDTO({
    required  this.id,
    required this.codigo,
    required this.descricao,
    required this.precoun,
    required this.ventrada,
    required this.quantidade,
    required this.tipo,
    required this.unidade,
    required this.unidadeTributavel,
    required this.data,
    required this.loja,
    required this.subTotal,
    required this.vendedorId,
    required this.urls,
  });

  static fromJson(item) {}
}

