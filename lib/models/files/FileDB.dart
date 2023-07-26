class FileDB {
  int id;
  String name;
  String? idpost;
  String type;
  dynamic data;
  String? idvendedor ;

  FileDB({
    required this.id,
    required this.name,
    required this.idpost,
    required this.type,
    required this.data,
    required this.idvendedor,
  });

  // Método para criar uma instância da classe a partir de um mapa JSON
  factory FileDB.fromJson(Map<String, dynamic> json) {
    return FileDB(
      id: json['id'],
      name: json['name'],
      idpost: json['idpost'],
      type: json['type'],
      data: json['data'],
      idvendedor: json['idvendedor'],
    );
  }

  // Método para converter a instância da classe em um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'idpost': idpost,
      'type': type,
      'data': data,
      'idvendedor': idvendedor,
    };
  }

  // Método para exibir os dados da instância como uma string
  @override
  String toString() {
    return 'FileDB{id: $id, name: $name, idpost: $idpost, type: $type, data: $data, idvendedor: $idvendedor}';
  }
}
