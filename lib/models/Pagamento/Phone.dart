
class Phone {
  String areaCode;
  String number;

  Phone({required this.areaCode, required this.number});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      areaCode: json['areaCode'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'areaCode': areaCode,
      'number': number,
    };
  }
}

class Identification {
  String type;
  String number;

  Identification({required this.type, required this.number});

  factory Identification.fromJson(Map<String, dynamic> json) {
    return Identification(
      type: json['type'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'number': number,
    };
  }
}
