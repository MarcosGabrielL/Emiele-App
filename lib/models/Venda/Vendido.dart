
class Vendido {
  String id;
  String vendedor_id;
  String codigo;
  String descricao;
  String tipo;
  String loja;
  String caixa;
  String datasaida;
  int idvenda;
  int quantidade;

  Vendido({
    required this.id,
    required this.vendedor_id,
    required this.codigo,
    required this.descricao,
    required this.tipo,
    required this.loja,
    required this.caixa,
    required this.datasaida,
    required this.idvenda,
    required this.quantidade,
  });
}