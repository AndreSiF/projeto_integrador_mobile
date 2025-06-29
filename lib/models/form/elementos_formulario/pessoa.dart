class Pessoa {
  final int? id;
  String? uuid;
  String? uuidFormulario;
  final String? nome;
  final String? cpf;
  final String? telefone;
  final String? email;
  final String? rgp;
  final String? endereco;
  final String? uf;
  final String? municipio;

  final String? razaoSocial;
  final String? cnpj;
  final String? cnae;
  final String? responsavelLegal;
  final String? cpfResponsavelLegal;
  final String? rgpResponsavelLegal;
  final String? telefoneResponsavelLegal;
  final String? emailResponsavelLegal;

  Pessoa({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.nome,
    this.cpf,
    this.telefone,
    this.email,
    this.rgp,
    this.endereco,
    this.uf,
    this.municipio,

    this.razaoSocial,
    this.cnpj,
    this.cnae,
    this.responsavelLegal,
    this.cpfResponsavelLegal,
    this.rgpResponsavelLegal,
    this.telefoneResponsavelLegal,
    this.emailResponsavelLegal,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_pessoa': id,
      'uuid_pessoa': uuid,
      'uuid_formulario_pessoa': uuidFormulario,
      'nome_pessoa': nome,
      'cpf_pessoa': cpf,
      'telefone_pessoa': telefone,
      'email_pessoa': email,

      'rgp_pessoa': rgp,
      'endereco:': endereco,
      'uf': uf,
      'municipio': municipio,

      'razao_social': razaoSocial,
      'cnpj': cnpj,
      'cnae': cnae,
      'responsavel_legal': responsavelLegal,
      'rgp_responsavel_legal': rgpResponsavelLegal,
      'telefone_responsavel_legal': telefoneResponsavelLegal,
      'email_responsavel_legal': emailResponsavelLegal,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: _parseInt(map['id_pessoa']),
      uuid: map['uuid_pessoa'] is String ? map['uuid_pessoa'] : null,
      uuidFormulario: map['uuid_formulario_pessoa'] is String ? map['uuid_formulario_pessoa'] : null,
      nome: map['nome_pessoa'] is String ? map['nome_pessoa'] : null,
      cpf: map['cpf_pessoa'] is String ? map['cpf_pessoa'] : null,
      telefone: map['telefone_pessoa'] is String ? map['telefone_pessoa'] : null,
      email: map['email_pessoa'] is String ? map['email_pessoa'] : null,
      rgp: map['rgp_pessoa'] is String ? map['rgp_pessoa'] : null,
      endereco: map['endereco'] is String ? map['endereco'] : null,
      uf: map['uf'] is String ? map['uf'] : null,
      municipio: map['municipio'] is String ? map['municipio'] : null,
      razaoSocial: map['razao_social'] is String ? map['razao_social'] : null,
      cnpj: map['cnpj'] is String ? map['cnpj'] : null,
      cnae: map['cnae'] is String ? map['cnae'] : null,
      responsavelLegal:  map['responsavel_legal'] is String ? map['responsavel_legal'] : null,
      rgpResponsavelLegal:  map['rgp_responsavel_legal'] is String ? map['rgp_responsavel_legal'] : null,
      telefoneResponsavelLegal:  map['telefone_responsavel_legal'] is String ? map['telefone_responsavel_legal'] : null,
      emailResponsavelLegal:  map['email_responsavel_legal'] is String ? map['email_responsavel_legal'] : null,
    );
  }
}

int? _parseInt(dynamic value) {
  if (value is int) {
    return value;
  } else if (value is String) {
    return value.isNotEmpty ? int.tryParse(value) : null;
  }
  return null;
}


