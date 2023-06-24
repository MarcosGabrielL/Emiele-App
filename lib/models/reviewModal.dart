class ReviewModal {
  String image;
  String name;
  double rating;
  String date;
  String comment;

  ReviewModal({
    required this.image,
    required this.name,
    required this.rating,
    required this.date,
    required this.comment,
  });

  factory ReviewModal.fromJson(Map<String, dynamic> json) {
    return ReviewModal(
      image: json['image'],
      name: json['name'],
      rating: json['rating'],
      date: json['date'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'rating': rating,
      'date': date,
      'comment': comment,
    };
  }
}
