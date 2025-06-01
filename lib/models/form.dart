class Formulario {
  final int? idForm;
  final int? idPessoa;

  // Identificação do Empreendimento
  final String? enderecoEmpre;
  final String? municipioEmpre;
  final String? ufEmpre;
  final double? latitude;
  final double? longitude;
  final int? dap;
  final int? cadAmbiental;
  final int? outorga;
  final int? ctf;
  final int? car;
  final int? oesa;
  final int? atendimentosAno;

  // Sistema de cultivo e Produção
  final String? tipoViveiro;
  final double? areaViveiro;
  final double? areaTaqueRede;
  final String? tipoSistemaFechado;
  final double? areaSistemaFechado;
  final double? areaRaceway;
  final String? especieProducao;
  final double? pesoProducao;
  final int? unidadesProducao;
  final double? areaJovemProducao;
  final String? especieAreaJov;
  final String? milheirosAreaJov;
  final String? especieOrnamental;
  final double? pesoOrnamental;
  final int? unidadesOrnamental;

  // Informações comerciais
  final String? ufAquisicaoJov;
  final String? especieAquiJov;
  final String? milheirosAquiJov;
  final String? origemRacao;
  final int? unidadesRacao;
  final double? quantidadeRacao;
  final String? ufOrigemComercialEspecie;
  final String? especieComercial;
  final double? prodComercial;
  final int? quantidadeComercial;
  final double? precoMedio;

  Formulario({
    this.idForm,
    this.idPessoa,
    this.enderecoEmpre,
    this.municipioEmpre,
    this.ufEmpre,
    this.latitude,
    this.longitude,
    this.dap,
    this.cadAmbiental,
    this.outorga,
    this.ctf,
    this.car,
    this.oesa,
    this.atendimentosAno,
    this.tipoViveiro,
    this.areaViveiro,
    this.areaTaqueRede,
    this.tipoSistemaFechado,
    this.areaSistemaFechado,
    this.areaRaceway,
    this.especieProducao,
    this.pesoProducao,
    this.unidadesProducao,
    this.areaJovemProducao,
    this.especieAreaJov,
    this.milheirosAreaJov,
    this.especieOrnamental,
    this.pesoOrnamental,
    this.unidadesOrnamental,
    this.ufAquisicaoJov,
    this.especieAquiJov,
    this.milheirosAquiJov,
    this.origemRacao,
    this.unidadesRacao,
    this.quantidadeRacao,
    this.ufOrigemComercialEspecie,
    this.especieComercial,
    this.prodComercial,
    this.quantidadeComercial,
    this.precoMedio,
  });

  factory Formulario.fromMap(Map<String, dynamic> map) {
    return Formulario(
      idForm: map['id_form'],
      idPessoa: map['id_pessoa'],
      enderecoEmpre: map['endereco_empre'],
      municipioEmpre: map['municipio_empre'],
      ufEmpre: map['uf_empre'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      dap: map['dap'],
      cadAmbiental: map['cad_ambiental'],
      outorga: map['outorga'],
      ctf: map['ctf'],
      car: map['car'],
      oesa: map['oesa'],
      atendimentosAno: map['atendimentos_ano'],
      tipoViveiro: map['tipo_viveiro'],
      areaViveiro: map['area_viveiro'],
      areaTaqueRede: map['area_taque_rede'],
      tipoSistemaFechado: map['tipo_sistema_fechado'],
      areaSistemaFechado: map['area_sistema_fechado'],
      areaRaceway: map['area_raceway'],
      especieProducao: map['especie_producao'],
      pesoProducao: map['peso_producao'],
      unidadesProducao: map['unidades_producao'],
      areaJovemProducao: map['area_jovem_producao'],
      especieAreaJov: map['especie_area_jov'],
      milheirosAreaJov: map['milheiros_area_jov'],
      especieOrnamental: map['especie_ornamental'],
      pesoOrnamental: map['peso_ornamental'],
      unidadesOrnamental: map['unidades_ornamental'],
      ufAquisicaoJov: map['uf_aquisicao_jov'],
      especieAquiJov: map['especie_aqui_jov'],
      milheirosAquiJov: map['milheiros_aqui_jov'],
      origemRacao: map['origem_racao'],
      unidadesRacao: map['unidades_racao'],
      quantidadeRacao: map['quantidade_racao'],
      ufOrigemComercialEspecie: map['uf_origem_comercial_especie'],
      especieComercial: map['especie_comercial'],
      prodComercial: map['prod_comercial'],
      quantidadeComercial: map['quantidade_comercial'],
      precoMedio: map['preco_medio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_form': idForm,
      'id_pessoa': idPessoa,
      'endereco_empre': enderecoEmpre,
      'municipio_empre': municipioEmpre,
      'uf_empre': ufEmpre,
      'latitude': latitude,
      'longitude': longitude,
      'dap': dap,
      'cad_ambiental': cadAmbiental,
      'outorga': outorga,
      'ctf': ctf,
      'car': car,
      'oesa': oesa,
      'atendimentos_ano': atendimentosAno,
      'tipo_viveiro': tipoViveiro,
      'area_viveiro': areaViveiro,
      'area_taque_rede': areaTaqueRede,
      'tipo_sistema_fechado': tipoSistemaFechado,
      'area_sistema_fechado': areaSistemaFechado,
      'area_raceway': areaRaceway,
      'especie_producao': especieProducao,
      'peso_producao': pesoProducao,
      'unidades_producao': unidadesProducao,
      'area_jovem_producao': areaJovemProducao,
      'especie_area_jov': especieAreaJov,
      'milheiros_area_jov': milheirosAreaJov,
      'especie_ornamental': especieOrnamental,
      'peso_ornamental': pesoOrnamental,
      'unidades_ornamental': unidadesOrnamental,
      'uf_aquisicao_jov': ufAquisicaoJov,
      'especie_aqui_jov': especieAquiJov,
      'milheiros_aqui_jov': milheirosAquiJov,
      'origem_racao': origemRacao,
      'unidades_racao': unidadesRacao,
      'quantidade_racao': quantidadeRacao,
      'uf_origem_comercial_especie': ufOrigemComercialEspecie,
      'especie_comercial': especieComercial,
      'prod_comercial': prodComercial,
      'quantidade_comercial': quantidadeComercial,
      'preco_medio': precoMedio,
    };
  }

  Formulario copyWith({
    int? idForm,
    int? idPessoa,
    String? enderecoEmpre,
    String? municipioEmpre,
    String? ufEmpre,
    double? latitude,
    double? longitude,
    int? dap,
    int? cadAmbiental,
    int? outorga,
    int? ctf,
    int? car,
    int? oesa,
    int? atendimentosAno,
    String? tipoViveiro,
    double? areaViveiro,
    double? areaTaqueRede,
    String? tipoSistemaFechado,
    double? areaSistemaFechado,
    double? areaRaceway,
    String? especieProducao,
    double? pesoProducao,
    int? unidadesProducao,
    double? areaJovemProducao,
    String? especieAreaJov,
    String? milheirosAreaJov,
    String? especieOrnamental,
    double? pesoOrnamental,
    int? unidadesOrnamental,
    String? ufAquisicaoJov,
    String? especieAquiJov,
    String? milheirosAquiJov,
    String? origemRacao,
    int? unidadesRacao,
    double? quantidadeRacao,
    String? ufOrigemComercialEspecie,
    String? especieComercial,
    double? prodComercial,
    int? quantidadeComercial,
    double? precoMedio,
  }) {
    return Formulario(
      idForm: idForm ?? this.idForm,
      idPessoa: idPessoa ?? this.idPessoa,
      enderecoEmpre: enderecoEmpre ?? this.enderecoEmpre,
      municipioEmpre: municipioEmpre ?? this.municipioEmpre,
      ufEmpre: ufEmpre ?? this.ufEmpre,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dap: dap ?? this.dap,
      cadAmbiental: cadAmbiental ?? this.cadAmbiental,
      outorga: outorga ?? this.outorga,
      ctf: ctf ?? this.ctf,
      car: car ?? this.car,
      oesa: oesa ?? this.oesa,
      atendimentosAno: atendimentosAno ?? this.atendimentosAno,
      tipoViveiro: tipoViveiro ?? this.tipoViveiro,
      areaViveiro: areaViveiro ?? this.areaViveiro,
      areaTaqueRede: areaTaqueRede ?? this.areaTaqueRede,
      tipoSistemaFechado: tipoSistemaFechado ?? this.tipoSistemaFechado,
      areaSistemaFechado: areaSistemaFechado ?? this.areaSistemaFechado,
      areaRaceway: areaRaceway ?? this.areaRaceway,
      especieProducao: especieProducao ?? this.especieProducao,
      pesoProducao: pesoProducao ?? this.pesoProducao,
      unidadesProducao: unidadesProducao ?? this.unidadesProducao,
      areaJovemProducao: areaJovemProducao ?? this.areaJovemProducao,
      especieAreaJov: especieAreaJov ?? this.especieAreaJov,
      milheirosAreaJov: milheirosAreaJov ?? this.milheirosAreaJov,
      especieOrnamental: especieOrnamental ?? this.especieOrnamental,
      pesoOrnamental: pesoOrnamental ?? this.pesoOrnamental,
      unidadesOrnamental: unidadesOrnamental ?? this.unidadesOrnamental,
      ufAquisicaoJov: ufAquisicaoJov ?? this.ufAquisicaoJov,
      especieAquiJov: especieAquiJov ?? this.especieAquiJov,
      milheirosAquiJov: milheirosAquiJov ?? this.milheirosAquiJov,
      origemRacao: origemRacao ?? this.origemRacao,
      unidadesRacao: unidadesRacao ?? this.unidadesRacao,
      quantidadeRacao: quantidadeRacao ?? this.quantidadeRacao,
      ufOrigemComercialEspecie: ufOrigemComercialEspecie ?? this.ufOrigemComercialEspecie,
      especieComercial: especieComercial ?? this.especieComercial,
      prodComercial: prodComercial ?? this.prodComercial,
      quantidadeComercial: quantidadeComercial ?? this.quantidadeComercial,
      precoMedio: precoMedio ?? this.precoMedio,
    );
  }

  @override
  String toString() {
    return '''
      Formulario{
      idForm: $idForm,
      idPessoa: $idPessoa,
      enderecoEmpre: $enderecoEmpre,
      municipioEmpre: $municipioEmpre,
      ufEmpre: $ufEmpre,
      latitude: $latitude,
      longitude: $longitude,
      dap: $dap,
      cadAmbiental: $cadAmbiental,
      outorga: $outorga,
      ctf: $ctf,
      car: $car,
      oesa: $oesa,
      atendimentosAno: $atendimentosAno,
      tipoViveiro: $tipoViveiro,
      areaViveiro: $areaViveiro,
      areaTaqueRede: $areaTaqueRede,
      tipoSistemaFechado: $tipoSistemaFechado,
      areaSistemaFechado: $areaSistemaFechado,
      areaRaceway: $areaRaceway,
      especieProducao: $especieProducao,
      pesoProducao: $pesoProducao,
      unidadesProducao: $unidadesProducao,
      areaJovemProducao: $areaJovemProducao,
      especieAreaJov: $especieAreaJov,
      milheirosAreaJov: $milheirosAreaJov,
      especieOrnamental: $especieOrnamental,
      pesoOrnamental: $pesoOrnamental,
      unidadesOrnamental: $unidadesOrnamental,
      ufAquisicaoJov: $ufAquisicaoJov,
      especieAquiJov: $especieAquiJov,
      milheirosAquiJov: $milheirosAquiJov,
      origemRacao: $origemRacao,
      unidadesRacao: $unidadesRacao,
      quantidadeRacao: $quantidadeRacao,
      ufOrigemComercialEspecie: $ufOrigemComercialEspecie,
      especieComercial: $especieComercial,
      prodComercial: $prodComercial,
      quantidadeComercial: $quantidadeComercial,
      precoMedio: $precoMedio
    }''';
  }
}
