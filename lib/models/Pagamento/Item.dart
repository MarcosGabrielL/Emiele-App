
class Item {
  String id;
  String title;
  String description;
  String categoryId;
  int quantity;
  String currencyId;
  String unitPrice;

  Item({
    required this.id,
    required this.title,
    required  this.description,
    required  this.categoryId,
    required  this.quantity,
    required  this.currencyId,
    required  this.unitPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      categoryId: json['categoryId'],
      quantity: json['quantity'],
      currencyId: json['currencyId'],
      unitPrice: json['unitPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'quantity': quantity,
      'currencyId': currencyId,
      'unitPrice': unitPrice,
    };
  }
}
