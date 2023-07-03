

class FileDB {
String id;
String name;
String idpost;
String type;
dynamic data;
String idvendedor;

FileDB({
required this.id,
required this.name,
required this.idpost,
required this.type,
required this.data,
required this.idvendedor,
});

  static fromJson(item) {}
}



