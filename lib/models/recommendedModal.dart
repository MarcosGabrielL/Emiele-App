class RecommendedModal {
  String image;
  String title;
  double price;
  double rating;
  int sale;

  RecommendedModal({
     required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.sale,
  });

  factory RecommendedModal.fromJson(Map<String, dynamic> json) {
    return RecommendedModal(
      image: json['image'],
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      sale: json['sale'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'rating': rating,
      'sale': sale,
    };
  }
}
