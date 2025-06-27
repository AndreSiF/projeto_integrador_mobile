import 'dart:ffi';

class PessoaN {
  final Int? idPessoa;
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

  PessoaN(
    this.idPessoa,
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
  );
}
