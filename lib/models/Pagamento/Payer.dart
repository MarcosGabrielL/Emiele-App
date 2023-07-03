
import 'Address.dart';
import 'Phone.dart';

class Payer {
  String name;
  String surname;
  String email;
  Phone phone;
  Identification identification;
  Address address;

  Payer({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.identification,
    required this.address,
  });

  factory Payer.fromJson(Map<String, dynamic> json) {
    return Payer(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phone: Phone.fromJson(json['phone']),
      identification: Identification.fromJson(json['identification']),
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone.toJson(),
      'identification': identification.toJson(),
      'address': address.toJson(),
    };
  }
}