
class ExcludedPaymentType {
  String id;

  ExcludedPaymentType({required this.id});

  factory ExcludedPaymentType.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentType(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}