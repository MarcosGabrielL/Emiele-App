class Frete {
  String id;
  String fretefixo;
  String frete10k;
  bool cobrafrete;
  String vendedorid;

  Frete({
    required this.id,
    required this.fretefixo,
    required this.frete10k,
    required this.cobrafrete,
    required this.vendedorid,
  });

  Object? toJson() {}

}