class CartModal {
  String image;
  String title;
  String desc;
  double price;
  int quantity;

  CartModal({
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
    required this.quantity,
  });

  factory CartModal.fromJson(Map<String, dynamic> json) {
    return CartModal(
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'price': price,
      'quantity': quantity,
    };
  }
}
