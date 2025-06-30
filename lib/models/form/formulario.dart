import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';

import 'elementos_formulario/producao_ornamental.dart';

class Formulario {
  final int? id;
  String? uuid;

  // Pessoa
  Pessoa? pessoa;

  // Responsável Técnico
  final bool? hasResponsavelTecnico;
  final String? nomeResponsavelTecnico;
  final String? registroResponsavelTecnico;
  final String? telefoneResponsavelTecnico;
  final String? emailResponsavelTecnico;

  // Empreendimento
  final String? enderecoEmpreendimento;
  final String? municipioEmpreendimento;
  final String? ufEmpreendimento;

  // Coordenadas Geográficas
  final String? latitude;
  final String? longitude;

  // Documentação
  final bool? hasDap;
  final int? dap;

  final bool? hasLicencaAmbiental;
  final int? licencaAmbiental;

  final bool? hasOutorga;
  final String? outorga;

  final bool? hasCtf;
  final int? ctf;

  final bool? hasCar;
  final String? car;

  final bool? hasOesa;
  final int? oesa;

  final bool? hasAssistenciaTecnica;
  final int? atendimentosAno;

  // Modelo e Produção
  final bool? hasViveiro;
  final String? tipoViveiro;
  final double? areaViveiro;

  // Tanque Rede
  final bool? hasTanqueRede;
  final double? areaTanqueRede;

  // Sistema Fechado
  final bool? hasSistemaFechado;
  final String? tipoSistemaFechado;
  final double? areaSistemaFechado;

  // Raceway
  final bool? hasRaceway;
  final double? areaRaceway;

  // Produção
  List<Producao>? producoes;

  // Forma Jovem
  final double? areaFormaJovem;
  List<FormaJovem>? formasJovem;

  // Ornamental
  List<ProducaoOrnamental>? producoesOrnamental;

  // Aquisição de formas jovens
  List<AquisicaoJovem>? aquisicoesFormaJovem;

  // Aquisição de Ração
  List<AquisicaoRacao>? aquisicoesRacao;

  // Comercialização por espécie
  List<Comercializacao>? comercializacaoEspecie;

  // Produção de Ornamentais
  List<ProducaoOrnamentais>? producoesOrnamentais;

  Formulario({
    this.id,
    this.uuid,
    this.pessoa,
    this.hasResponsavelTecnico,
    this.nomeResponsavelTecnico,
    this.registroResponsavelTecnico,
    this.telefoneResponsavelTecnico,
    this.emailResponsavelTecnico,
    this.enderecoEmpreendimento,
    this.municipioEmpreendimento,
    this.ufEmpreendimento,
    this.latitude,
    this.longitude,
    this.hasDap,
    this.dap,
    this.hasLicencaAmbiental,
    this.licencaAmbiental,
    this.hasOutorga,
    this.outorga,
    this.hasCtf,
    this.ctf,
    this.hasCar,
    this.car,
    this.hasOesa,
    this.oesa,
    this.hasAssistenciaTecnica,
    this.atendimentosAno,
    this.hasViveiro,
    this.tipoViveiro,
    this.areaViveiro,
    this.hasTanqueRede,
    this.areaTanqueRede,
    this.hasSistemaFechado,
    this.tipoSistemaFechado,
    this.areaSistemaFechado,
    this.areaRaceway,
    this.hasRaceway,
    this.producoes,
    this.areaFormaJovem,
    this.formasJovem,
    this.producoesOrnamental,
    this.aquisicoesFormaJovem,
    this.aquisicoesRacao,
    this.comercializacaoEspecie,
    this.producoesOrnamentais,
  });

  Map<String, dynamic> toMap(){
    return{
      'id_formulario': id,
      'uuid_formulario': uuid,
      //'pessoa': pessoa?.toMap(),
      'has_responsavel_tecnico': hasResponsavelTecnico != null ? (hasResponsavelTecnico! ? 1 : 0) : null,
      'nome_responsavel_tecnico': nomeResponsavelTecnico,
      'registro_responsavel_tecnico': registroResponsavelTecnico,
      'telefone_responsavel_tecnico': telefoneResponsavelTecnico,
      'email_responsavel_tecnico': emailResponsavelTecnico,
      'endereco_empreendimento': enderecoEmpreendimento,
      'municipio_empreendimento': enderecoEmpreendimento,
      'uf_empreendimento': ufEmpreendimento,
      'latitude': latitude,
      'longitude': longitude,
      'has_dap': hasDap != null ? (hasDap! ? 1 : 0) : null,
      'dap': dap,
      'has_licenca_ambiental': hasLicencaAmbiental != null ? (hasLicencaAmbiental! ? 1 : 0) : null,
      'licenca_ambiental': licencaAmbiental,
      'has_outorga': hasOutorga != null ? (hasOutorga! ? 1 : 0) : null,
      'outorga': outorga,
      'has_ctf': hasCtf != null ? (hasCtf! ? 1 : 0) : null,
      'ctf': ctf,
      'has_car': hasCar != null ? (hasCar! ? 1 : 0) : null,
      'car': car,
      'has_oesa': hasOesa != null ? (hasOesa! ? 1 : 0) : null,
      'oesa': oesa,
      'has_assistencia_tecnica': hasAssistenciaTecnica != null ? (hasAssistenciaTecnica! ? 1 : 0) : null,
      'atendimentos_ano': atendimentosAno,
      'has_viveiro': hasViveiro != null ? (hasViveiro! ? 1 : 0) : null,
      'tipo_viveiro': tipoViveiro,
      'area_viveiro': areaViveiro,
      'has_tanque_rede': hasTanqueRede != null ? (hasTanqueRede! ? 1 : 0) : null,
      'area_tanque_rede': areaTanqueRede,
      'has_sistema_fechado': hasSistemaFechado != null ? (hasSistemaFechado! ? 1 : 0) : null,
      'tipo_sistema_fechado': tipoSistemaFechado,
      'area_sistema_fechado': areaSistemaFechado,
      'has_raceway': hasRaceway != null ? (hasRaceway! ? 1 : 0) : null,
      'area_raceway': areaRaceway,
      // 'producoes': producoes?.map((p) => p.toMap()).toList(),
      'area_forma_jovem': areaFormaJovem,
      // 'formas_jovem': formasJovem?.map((fj) => fj.toMap()).toList(),
      // 'producoes_ornamental': producoesOrnamental?.map((po) => po.toMap()).toList(),
      // 'aquisicoes_forma_jovem': aquisicoesFormaJovem?.map((afj) => afj.toMap()).toList(),
      // 'aquisicoes_racao': aquisicoesRacao?.map((ar) => ar.toMap()).toList(),
      // 'comercializacao_especie': comercializacaoEspecie?.map((ce) => ce.toMap()).toList(),
      // 'producoes_ornamentais': producoesOrnamentais?.map((pos) => pos.toMap()).toList(),
    };
  }

  factory Formulario.fromMap(Map<String, dynamic> map) {
    return Formulario(
      id: _parseInt(map['id_comercializacao']),
      uuid: map['uuid_formulario'] as String?,
      //pessoa: map['pessoa'] != null ? Pessoa.fromMap(map['pessoa']) : null,
      hasResponsavelTecnico: map['has_responsavel_tecnico'] == 1,
      nomeResponsavelTecnico: map['nome_responsavel_tecnico'] is String ? map['nome_responsavel_tecnico'] : null,
      registroResponsavelTecnico: map['registro_responsavel_tecnico'] is String ? map['registro_responsavel_tecnico'] : null,
      telefoneResponsavelTecnico: map['telefone_responsavel_tecnico'] is String ? map['telefone_responsavel_tecnico'] : null,
      emailResponsavelTecnico: map['email_responsavel_tecnico'] is String ? map['email_responsavel_tecnico'] : null,
      enderecoEmpreendimento: map['endereco_empreendimento'] is String ? map['endereco_empreendimento'] : null,
      municipioEmpreendimento: map['municipio_empreendimento'] is String ? map['municipio_empreendimento'] : null,
      ufEmpreendimento: map['uf_empreendimento'] is String ? map['uf_empreendimento'] : null,
      latitude: map['latitude'] is String ? map['latitude'] : null,
      longitude: map['longitude'] is String ? map['longitude'] : null,
      hasDap: map['has_dap'] == 1,
      dap: _parseInt(map['dap']),
      hasLicencaAmbiental: map['has_licenca_ambiental'] == 1,
      licencaAmbiental: _parseInt(map['licenca_ambiental']),
      hasOutorga: map['has_outorga'] == 1,
      outorga: map['outorga'] is String ? map['outorga'] : null,
      hasCtf: map['has_ctf'] == 1,
      ctf: _parseInt(map['ctf']),
      hasCar: map['has_car'] == 1,
      car: map['car'] is String ? map['car'] : null,
      hasOesa: map['has_oesa'] == 1,
      oesa: _parseInt(map['oesa']),
      hasAssistenciaTecnica: map['has_assistencia_tecnica'] == 1,
      atendimentosAno: _parseInt(map['atendimentos_ano']),
      hasViveiro: map['has_viveiro'] == 1,
      tipoViveiro: map['tipo_viveiro'] is String ? map['tipo_viveiro'] : null,
      areaViveiro: _parseDouble(map['area_viveiro']),
      hasTanqueRede: map['has_tanque_rede'] == 1,
      areaTanqueRede: _parseDouble(map['area_tanque_rede']),
      hasSistemaFechado: map['has_sistema_fechado'] == 1,
      tipoSistemaFechado: map['tipo_sistema_fechado'] is String ? map['tipo_sistema_fechado'] : null,
      areaSistemaFechado: _parseDouble(map['area_sistema_fechado']),
      hasRaceway: map['has_raceway'] == 1,
      areaRaceway: _parseDouble(map['area_raceway']),
      // producoes: map['producoes'] != null ? (map['producoes'] as List<dynamic>).map((item) => Producao.fromMap(item)).toList() : null,
      // areaFormaJovem: map['area_forma_jovem'] is double ? map['area_forma_jovem'] : null,
      // formasJovem: map['formas_jovem'] != null ? (map['formas_jovem'] as List<dynamic>).map((item) => FormaJovem.fromMap(item)).toList() : null,
      // producoesOrnamental: map['producoes_ornamental'] != null ? (map['producoes_ornamental'] as List<dynamic>).map((item) => ProducaoOrnamental.fromMap(item)).toList() : null,
      // aquisicoesFormaJovem: map['aquisicoes_forma_jovem'] != null ? (map['aquisicoes_forma_jovem'] as List<dynamic>).map((item) => AquisicaoJovem.fromMap(item)).toList() : null,
      // aquisicoesRacao: map['aquisicoes_racao'] != null ? (map['aquisicoes_racao'] as List<dynamic>).map((item) => AquisicaoRacao.fromMap(item)).toList() : null,
      // comercializacaoEspecie: map['comercializacao_especie'] != null ? (map['comercializacao_especie'] as List<dynamic>).map((item) => Comercializacao.fromMap(item)).toList() : null,
      // producoesOrnamentais: map['producoes_ornamentais'] != null ? (map['producoes_ornamentais'] as List<dynamic>).map((item) => ProducaoOrnamentais.fromMap(item)).toList() : null,
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

double? _parseDouble(dynamic value) {
  if (value is double) {
    return value;
  } else if (value is String) {
    return value.isNotEmpty ? double.tryParse(value) : null;
  }
  return null;
}


