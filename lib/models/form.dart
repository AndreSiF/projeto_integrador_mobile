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
      idForm: _parseInt(map['id_form']),
      idPessoa: _parseInt(map['id_pessoa']),
      enderecoEmpre: map['endereco_empre'] is String ? map['endereco_empre'] : null,
      municipioEmpre: map['municipio_empre'] is String ? map['municipio_empre'] : null,
      ufEmpre: map['uf_empre'] is String ? map['uf_empre'] : null,
      latitude: map['latitude'] is double ? map['latitude'] : _parseDouble(map['latitude']),
      longitude: map['longitude'] is double ? map['longitude'] : _parseDouble(map['longitude']),
      dap: _parseInt(map['dap']),
      cadAmbiental: _parseInt(map['cad_ambiental']),
      outorga: _parseInt(map['outorga']),
      ctf: _parseInt(map['ctf']),
      car: _parseInt(map['car']),
      oesa: _parseInt(map['oesa']),
      atendimentosAno: _parseInt(map['atendimentos_ano']),
      tipoViveiro: map['tipo_viveiro'] is String ? map['tipo_viveiro'] : null,
      areaViveiro: map['area_viveiro'] is double ? map['area_viveiro'] : _parseDouble(map['area_viveiro']),
      areaTaqueRede: map['area_taque_rede'] is double ? map['area_taque_rede'] : _parseDouble(map['area_taque_rede']),
      tipoSistemaFechado: map['tipo_sistema_fechado'] is String ? map['tipo_sistema_fechado'] : null,
      areaSistemaFechado: map['area_sistema_fechado'] is double ? map['area_sistema_fechado'] : _parseDouble(map['area_sistema_fechado']),
      areaRaceway: map['area_raceway'] is double ? map['area_raceway'] : _parseDouble(map['area_raceway']),
      especieProducao: map['especie_producao'] is String ? map['especie_producao'] : null,
      pesoProducao: map['peso_producao'] is double ? map['peso_producao'] : _parseDouble(map['peso_producao']),
      unidadesProducao: _parseInt(map['unidades_producao']),
      areaJovemProducao: map['area_jovem_producao'] is double ? map['area_jovem_producao'] : _parseDouble(map['area_jovem_producao']),
      especieAreaJov: map['especie_area_jov'] is String ? map['especie_area_jov'] : null,
      milheirosAreaJov: map['milheiros_area_jov'] is String ? map['milheiros_area_jov'] : null,
      especieOrnamental: map['especie_ornamental'] is String ? map['especie_ornamental'] : null,
      pesoOrnamental: map['peso_ornamental'] is double ? map['peso_ornamental'] : _parseDouble(map['peso_ornamental']),
      unidadesOrnamental: _parseInt(map['unidades_ornamental']),
      ufAquisicaoJov: map['uf_aquisicao_jov'] is String ? map['uf_aquisicao_jov'] : null,
      especieAquiJov: map['especie_aqui_jov'] is String ? map['especie_aqui_jov'] : null,
      milheirosAquiJov: map['milheiros_aqui_jov'] is String ? map['milheiros_aqui_jov'] : null,
      origemRacao: map['origem_racao'] is String ? map['origem_racao'] : null,
      unidadesRacao: _parseInt(map['unidades_racao']),
      quantidadeRacao: map['quantidade_racao'] is double ? map['quantidade_racao'] : _parseDouble(map['quantidade_racao']),
      ufOrigemComercialEspecie: map['uf_origem_comercial_especie'] is String ? map['uf_origem_comercial_especie'] : null,
      especieComercial: map['especie_comercial'] is String ? map['especie_comercial'] : null,
      prodComercial: map['prod_comercial'] is double ? map['prod_comercial'] : _parseDouble(map['prod_comercial']),
      quantidadeComercial: _parseInt(map['quantidade_comercial']),
      precoMedio: map['preco_medio'] is double ? map['preco_medio'] : _parseDouble(map['preco_medio']),
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
    return 'Formulario{idForm: $idForm, enderecoEmpre: $enderecoEmpre, precoMedio: $precoMedio}';
  }
}


int? _parseInt(dynamic value) {
  if (value is int) {
    return value;
  }
  else if (value is String) {
    return value.isNotEmpty ? int.tryParse(value) : null;
  }
  return null;
}

double? _parseDouble(dynamic value) {
  if (value is double) {
    return value;
  }
  else if (value is String) {
    return value.isNotEmpty ? double.tryParse(value) : null;
  }
  return null;
  }
