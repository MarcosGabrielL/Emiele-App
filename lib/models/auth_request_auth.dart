class AuthModel {
  final String email;
  final String password;

  AuthModel({
    required this.email,
    required this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
