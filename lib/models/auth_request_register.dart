class RegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String tipo;

  RegisterModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.tipo,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'tipo': tipo,
    };
  }
}
