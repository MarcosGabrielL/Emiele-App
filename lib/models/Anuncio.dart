class Anuncio {
  int id;
  String vendedor;
  String id_imagem;
  String titulo;
  String subtitulo;

  Anuncio({
    required this.id,
    required this.vendedor,
    required this.id_imagem,
    required this.titulo,
    required this.subtitulo,
  });

  // Construtor nomeado para criar um objeto Anuncio a partir de um mapa (json)
  factory Anuncio.fromJson(Map<String, dynamic> json) {
    return Anuncio(
      id: json['id'],
      vendedor: json['vendedor'],
      id_imagem: json['id_imagem'],
      titulo: json['titulo'],
      subtitulo: json['subtitulo'],
    );
  }

  // Método toJson para converter um objeto Anuncio em um mapa (json)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendedor': vendedor,
      'id_imagem': id_imagem,
      'titulo': titulo,
      'subtitulo': subtitulo,
    };
  }

  // Método toString para representar o objeto Anuncio como uma string formatada
  @override
  String toString() {
    return 'Anuncio { id: $id, vendedor: $vendedor, id_imagem: $id_imagem, titulo: $titulo, subtitulo: $subtitulo }';
  }
}
