
class Address {
  String zipCode;
  String streetName;

  Address({required this.zipCode, required this.streetName});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zipCode'],
      streetName: json['streetName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zipCode': zipCode,
      'streetName': streetName,
    };
  }
}