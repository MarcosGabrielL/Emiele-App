
class PreferenceItem {
  String name;
  int quantity;
  int price;

  PreferenceItem({required this.name, required this.quantity, required this.price});

  factory PreferenceItem.fromJson(Map<String, dynamic> json) {
    return PreferenceItem(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}