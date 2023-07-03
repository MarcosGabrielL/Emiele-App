
class ResponseVendas {
  String total;
  String percentual;

  ResponseVendas({
    required this.total,
    required this.percentual,
  });

  static Future<ResponseVendas>? fromJson(decode) {}
}