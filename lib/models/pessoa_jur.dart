class PessoaJuridica{
  final int? idJur;
  final String razaoSocial;
  final String cnpj;
  final int cnae;
  final String uf;
  final String municipio;
  final String endereco;
  final String nomeResp;
  final String cpfResp;
  final String rgpResp;
  final int telefoneResp;
  final String emailResp;

  PessoaJuridica({
    this.idJur,
    required this.razaoSocial,
    required this.cnpj,
    required this.cnae,
    required this.uf,
    required this.municipio,
    required this.endereco,
    required this.nomeResp,
    required this.cpfResp,
    required this.rgpResp,
    required this.telefoneResp,
    required this.emailResp
  });

  Map<String, dynamic> toMap() {
      return {
        'id_jur' : idJur,
        'razao_social' : razaoSocial,
        'cpnj' : cnpj,
        'cnae' : cnae,
        'uf' : uf,
        'municipio' : municipio,
        'endereco' : endereco,
        'nome_resp' : nomeResp,
        'cpf_resp' : cpfResp,
        'rpg' : rgpResp,
        'telefone' : telefoneResp,
        'email' : emailResp
      };
    }

    factory PessoaJuridica.fromMap(Map<String, dynamic> map){
      return PessoaJuridica(
        idJur : map['id_jur'],
        razaoSocial: map['razao_social'], 
        cnpj: map['cnpj'], 
        cnae: map['cnae'], 
        uf: map['uf'], 
        municipio: map['municipio'], 
        endereco: map['endereco'], 
        nomeResp: map['nome_resp'], 
        cpfResp: map['cpf_resp'],
        rgpResp: map['rgp'], 
        telefoneResp: map['telefone'], 
        emailResp: map['email']
        );
    }

}