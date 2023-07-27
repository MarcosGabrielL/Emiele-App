import 'dart:convert';

class UserModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String tipo;
  final String instancia;

  UserModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.tipo,
    required this.instancia,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "tipo": tipo,
      "instancia": instancia,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      tipo: json['tipo'],
      instancia: json['instancia'],
    );
  }

  String encodeToJson() => json.encode(toJson());

  factory UserModel.decodeFromJson(String jsonString) =>
      UserModel.fromJson(json.decode(jsonString));
}
