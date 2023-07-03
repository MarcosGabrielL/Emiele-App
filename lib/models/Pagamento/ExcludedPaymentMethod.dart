
class ExcludedPaymentMethod {
  String id;

  ExcludedPaymentMethod({required this.id});

  factory ExcludedPaymentMethod.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentMethod(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
