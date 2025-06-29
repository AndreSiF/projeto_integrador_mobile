class PessoaOld{
  final int? idPessoa;
  final String? nome;
  final String? cpf;
  final int? telefone;
  final String? email;
  final int? rgp;
  final String? uf;
  final String? municipio;
  final String? endereco;
  final String? razaoSocial;
  final String? cnpj;
  final String? cnae;

  PessoaOld({
    this.idPessoa,
    this.nome,
    this.cpf,
    this.telefone,
    this.email,
    this.rgp,
    this.uf,
    this.municipio,
    this.endereco,
    this.razaoSocial,
    this.cnpj,
    this.cnae
  });

  Map<String, dynamic> toMap() {
      return {
        'id_pessoa' : idPessoa,
        'nome' : nome,
        'cpf' : cpf,
        'telefone' : telefone,
        'email' : email,
        'rgp' : rgp,
        'uf' : uf,
        'municipio' : municipio,
        'endereco' : endereco,
        'razao_social' : razaoSocial,
        'cnpj' : cnpj,
        'cnae' : cnae
      };
    }

  factory PessoaOld.fromMap(Map<String, dynamic> map) {
    return PessoaOld(
      idPessoa: _parseInt(map['id_pessoa']),
      nome: map['nome'] is String ? map['nome'] : null,
      cpf: map['cpf'] is String ? map['cpf'] : null,
      telefone: map['telefone'] is int ? map['telefone'] : _parseInt(map['telefone']),
      email: map['email'] is String ? map['email'] : null,
      rgp: map['rgp'] is int ? map['rgp'] : _parseInt(map['rgp']),
      uf: map['uf'] is String ? map['uf'] : null,
      municipio: map['municipio'] is String ? map['municipio'] : null,
      endereco: map['endereco'] is String ? map['endereco'] : null,
      razaoSocial: map['razao_social'] is String ? map['razao_social'] : null,
      cnpj: map['cnpj'] is String ? map['cnpj'] : null,
      cnae: map['cnae'] is String ? map['cnae'] : null,
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
