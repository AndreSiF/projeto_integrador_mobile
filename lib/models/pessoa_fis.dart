class PessoaFisica{
  final int? idFis;
  final String nome;
  final String cpf;
  final int telefone;
  final String email;
  final int rgp;
  final String uf;
  final String municipio;
  final String endereco;

  PessoaFisica({
    this.idFis,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.rgp,
    required this.uf,
    required this.municipio,
    required this.endereco
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
        'endereco' : endereco
      };
    }

    factory PessoaFisica.fromMap(Map<String, dynamic> map){
      return PessoaFisica(
        idFis : map['id_fis'],
        nome: map['nome'], 
        cpf: map['cpf'], 
        telefone: map['telefone'], 
        email: map['email'], 
        rgp: map['rgp'], 
        uf: map['uf'], 
        municipio: map['municipio'], 
        endereco: map['endereco']
        );
    }

}