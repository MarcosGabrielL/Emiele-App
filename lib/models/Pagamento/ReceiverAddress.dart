
class ReceiverAddress {
  String floor;
  String apartment;
  String zipCode;
  String streetName;

  ReceiverAddress({
    required this.floor,
    required this.apartment,
    required this.zipCode,
    required this.streetName,
  });

  factory ReceiverAddress.fromJson(Map<String, dynamic> json) {
    return ReceiverAddress(
      floor: json['floor'],
      apartment: json['apartment'],
      zipCode: json['zipCode'],
      streetName: json['streetName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'floor': floor,
      'apartment': apartment,
      'zipCode': zipCode,
      'streetName': streetName,
    };
  }
}