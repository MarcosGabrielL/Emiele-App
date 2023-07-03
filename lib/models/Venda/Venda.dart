class Venda {
  String id;
  String diavenda;
  int idvendas;
  String caixa;
  String loja;
  String datavenda;
  String datacancelamento;
  String valor;
  double recebido1;
  double recebido2;
  double recebido3;
  String troco;
  String modopagamento1;
  String modopagamento2;
  String modopagamento3;
  String vendedor_id;
  String comprador_id;
  String status;

  Venda({
    required this.id,
    required this.diavenda,
    required this.idvendas,
    required this.caixa,
    required this.loja,
    required this.datavenda,
    required this.datacancelamento,
    required this.valor,
    required this.recebido1,
    required this.recebido2,
    required this.recebido3,
    required this.troco,
    required this.modopagamento1,
    required this.modopagamento2,
    required this.modopagamento3,
    required this.vendedor_id,
    required this.comprador_id,
    required this.status,
  });

  static fromJson(item) {}

  Object? toJson() {}
}