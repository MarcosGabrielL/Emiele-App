class Vendedor {
  int? id;
  String? CNPJ;
  String? nomeFantasia;
  String? descricao;
  String? cidade;
  String? CEP;
  String? CFOP;
  String? razaoSocial;
  String? rua;
  String? bairro;
  String? numero;
  String? estado;
  String? uf;
  String? telefone;
  String? email;
  String? certificado;
  String? numeroSerie;
  int? ambiente;
  int? serie;
  String? dataInicio;
  String? dataFim;
  String? codigoRegimeTributario;
  String? ICMS;
  String? PIS;
  String? COFINS;
  String? IPI;
  int? cTipo;
  String? cSenha;
  String? cValidade;
  String? NCM;
  String? CST;
  String? codigoCity;
  String? inscricaoEstadual;
  String? IBPT;
  String? idToken;
  String? CSC;

  Vendedor({
    this.id,
    this.CNPJ,
    this.nomeFantasia,
    this.descricao,
    this.cidade,
    this.CEP,
    this.CFOP,
    this.razaoSocial,
    this.rua,
    this.bairro,
    this.numero,
    this.estado,
    this.uf,
    this.telefone,
    this.email,
    this.certificado,
    this.numeroSerie,
    this.ambiente,
    this.serie,
    this.dataInicio,
    this.dataFim,
    this.codigoRegimeTributario,
    this.ICMS,
    this.PIS,
    this.COFINS,
    this.IPI,
    this.cTipo,
    this.cSenha,
    this.cValidade,
    this.NCM,
    this.CST,
    this.codigoCity,
    this.inscricaoEstadual,
    this.IBPT,
    this.idToken,
    this.CSC,
  });

  // Construtor factory para criar um objeto Vendedor a partir de um mapa JSON
  factory Vendedor.fromJson(Map<String, dynamic> json) {
    return Vendedor(
      id: json['id'],
      CNPJ: json['CNPJ'],
      nomeFantasia: json['nomefantasia'],
      descricao: json['descricao'],
      cidade: json['Cidade'],
      CEP: json['CEP'],
      // Restante dos campos
    );
  }

  // Método toJson para converter um objeto Vendedor em um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'CNPJ': CNPJ,
      'nomefantasia': nomeFantasia,
      'descricao': descricao,
      'Cidade': cidade,
      'CEP': CEP,
      // Restante dos campos
    };
  }

  // Método toString para representar o objeto Vendedor como uma string
  @override
  String toString() {
    return 'Vendedor{id: $id, CNPJ: $CNPJ, nomeFantasia: $nomeFantasia, descricao: $descricao, Cidade: $cidade, CEP: $CEP, /* Restante dos campos */}';
  }
}
