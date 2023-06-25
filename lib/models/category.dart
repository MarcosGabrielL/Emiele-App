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


final Category Porcoes = Category(
  description: 'Porcoes',
  image: 'assets/categories/soup.png',
);
final Category Saladas = Category(
  description: 'Saladas',
  image: 'assets/categories/salad.png',
);
final Category Aves = Category(
  description: 'Aves',
  image: 'assets/categories/chickenleg.png',
);
final Category Peixes = Category(
  description: 'Peixes',
  image: 'assets/categories/fish.png',
);
final Category Carnes = Category(
  description: 'Carnes',
  image: 'assets/categories/meat.png',
);
final Category Combos = Category(
  description: 'Combos',
  image: 'assets/categories/combos.png',
);
final Category Lanches = Category(
  description: 'Lanches',
  image: 'assets/categories/burrito.png',
);
final Category Sanduiches = Category(
  description: 'Sanduiches',
  image: 'assets/categories/taco.png',
);
final Category Executivos = Category(
  description: 'Executivos',
  image: 'assets/categories/friedrice.png',
);
final Category Marmitex = Category(
  description: 'Marmitex',
  image: 'assets/categories/takeaway.png',
);

final Category Guarnicoes = Category(
  description: 'Guarnicoes',
  image: 'assets/categories/mashedpotato.png',
);

final Category Sobremesas = Category(
  description: 'Sobremesas',
  image: 'assets/categories/shavedice.png',
);

final Category Bebidas = Category(
  description: 'Bebidas',
  image: 'assets/categories/drink.png',
);

final List<Category> categories = [
  Marmitex,
  Executivos,
  Sanduiches,
  Lanches,
  Combos,
  Carnes,
  Peixes,
  Aves,
  Saladas,
  Porcoes,
  Guarnicoes,
  Sobremesas,
  Bebidas,
];
