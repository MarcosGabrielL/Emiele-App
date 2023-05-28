class Category {
  final String description;
  final String image;

  Category({required this.description, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image': image,
    };
  }
}


final Category Civil = Category(
  description: 'Civil',
  image: 'assets/categories/civil.png',
);
final Category Penal = Category(
  description: 'Penal',
  image: 'assets/categories/penal.png',
);
final Category Trabalhista = Category(
  description: 'Trabalhista',
  image: 'assets/categories/trabalhista.png',
);
final Category Empresarial = Category(
  description: 'Empresarial',
  image: 'assets/categories/empresarial.png',
);
final Category Tributario = Category(
  description: 'Tributário',
  image: 'assets/categories/tax.png',
);
final Category Ambiental = Category(
  description: 'Ambiental',
  image: 'assets/categories/ambiental.png',
);
final Category Internacional = Category(
  description: 'Internacional',
  image: 'assets/images/steven.jpg',
);
final Category Administrativo = Category(
  description: 'Administrativo',
  image: 'assets/images/greg.jpg',
);
final Category Consumidor = Category(
  description: 'Consumidor',
  image: 'assets/images/james.jpg',
);
final Category Previdenciario = Category(
  description: 'Previdenciário',
  image: 'assets/images/john.jpg',
);

final List<Category> categories = [
  Civil,
  Penal,
  Trabalhista,
  Empresarial,
  Tributario,
  Ambiental,
  Internacional,
  Administrativo,
  Consumidor,
  Previdenciario,
];
