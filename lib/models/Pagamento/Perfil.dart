class Perfil {
  String id;
  String email;
  String password;
  String firstName;
  String lastName;
  String banco;
  String tipoconta;
  String numeroconta;
  String agencia;
  String nomecompleto;
  String cpf;
  String numeroCartao1;
  String numeroCartao2;
  String numeroCartao3;
  String numeroCartao4;
  String titular;
  String mesvencimento;
  String anovencimento;
  String cvv;

  Perfil({
   required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.banco,
    required this.tipoconta,
    required this.numeroconta,
    required this.agencia,
    required this.nomecompleto,
    required this.cpf,
    required this.numeroCartao1,
    required this.numeroCartao2,
    required this.numeroCartao3,
    required this.numeroCartao4,
    required  this.titular,
    required this.mesvencimento,
    required this.anovencimento,
    required this.cvv,
  });

  factory Perfil.fromJson(Map<String, dynamic> json) {
    return Perfil(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      banco: json['banco'],
      tipoconta: json['tipoconta'],
      numeroconta: json['numeroconta'],
      agencia: json['agencia'],
      nomecompleto: json['nomecompleto'],
      cpf: json['cpf'],
      numeroCartao1: json['numeroCartao1'],
      numeroCartao2: json['numeroCartao2'],
      numeroCartao3: json['numeroCartao3'],
      numeroCartao4: json['numeroCartao4'],
      titular: json['titular'],
      mesvencimento: json['mesvencimento'],
      anovencimento: json['anovencimento'],
      cvv: json['cvv'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'banco': banco,
      'tipoconta': tipoconta,
      'numeroconta': numeroconta,
      'agencia': agencia,
      'nomecompleto': nomecompleto,
      'cpf': cpf,
      'numeroCartao1': numeroCartao1,
      'numeroCartao2': numeroCartao2,
      'numeroCartao3': numeroCartao3,
      'numeroCartao4': numeroCartao4,
      'titular': titular,
      'mesvencimento': mesvencimento,
      'anovencimento': anovencimento,
      'cvv': cvv,
    };
  }
}