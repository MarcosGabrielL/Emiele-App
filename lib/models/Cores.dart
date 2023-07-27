class Cores {
  int id;
  String idpost;
  List<String> cores;
  bool hasVariedade;
  String vendedorId;

  Cores({
    required this.id,
    required this.idpost,
    required this.cores,
    required this.hasVariedade,
    required this.vendedorId,
  });

  // Método para criar uma instância de Cores a partir de um mapa (JSON)
  factory Cores.fromJson(Map<String, dynamic> json) {
    return Cores(
      id: json['id'],
      idpost: json['idpost'],
      cores: json['cores'] != null ? List<String>.from(json['cores']) : [],
      hasVariedade: json['hasvariedade'] ?? false,
      vendedorId: json['vendedorid'],
    );
  }

  // Método para converter a instância de Cores em um mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idpost': idpost,
      'cores': cores,
      'hasvariedade': hasVariedade,
      'vendedorid': vendedorId,
    };
  }
}
