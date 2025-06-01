class Pessoa{
  final int? idFis;
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

  Pessoa({
    this.idFis,
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
        'id_fis' : idFis,
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

    factory Pessoa.fromMap(Map<String, dynamic> map){
      return Pessoa(
        idFis : map['id_fis'],
        nome: map['nome'], 
        cpf: map['cpf'], 
        telefone: map['telefone'], 
        email: map['email'], 
        rgp: map['rgp'], 
        uf: map['uf'], 
        municipio: map['municipio'], 
        endereco: map['endereco'],
        razaoSocial: map['razao_social'],
        cnpj: map['cnpj'],
        cnae: map['cnae']
        );
    }

}