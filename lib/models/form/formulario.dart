import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';

class FormularioN {
  final int? id;
  final String? uuid;

  // Pessoa
  final PessoaN? pessoa;

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

  // Raceway
  final bool? hasRaceway;
  final double? areaRaceway;

  // Produção
  final List<Producao>? producoes;

  // Forma Jovem
  final double? areaFormaJovem;
  final List<FormaJovem>? formasJovem;

  // Ornamental
  final List<Producao>? producoesOrnamental;

  // Aquisição de formas jovens
  final List<AquisicaoJovem>? aquisicoesFormaJovem;

  // Aquisição de Ração
  final List<AquisicaoRacao>? aquisicoesRacao;

  // Comercialização por espécie
  final List<Comercializacao>? comercializacaoEspecie;

  // Produção de Ornamentais
  final List<ProducaoOrnamentais>? producoesOrnamentais;

  FormularioN({
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
      'pessoa': pessoa?.toMap(),
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
      'tipó_viveiro': tipoViveiro,
      'area_viveiro': areaViveiro,
      'has_tanque_rede': hasTanqueRede != null ? (hasTanqueRede! ? 1 : 0) : null,
      'area_tanque_rede': areaTanqueRede,
      'has_sistema_fechado': hasSistemaFechado != null ? (hasSistemaFechado! ? 1 : 0) : null,
      'tipo_sistema_fechado': tipoSistemaFechado,
      'has_raceway': hasRaceway != null ? (hasRaceway! ? 1 : 0) : null,
      'area_raceway': areaRaceway,
      'producoes': producoes?.map((p) => p.toMap()).toList(),
      'area_forma_jovem': areaFormaJovem,
      'formas_jovem': formasJovem?.map((fj) => fj.toMap()).toList(),
      'producoes_ornamental': producoesOrnamental?.map((po) => po.toMap()).toList(),
      'aquisicoes_forma_jovem': aquisicoesFormaJovem?.map((afj) => afj.toMap()).toList(),
      'aquisicoes_racao': aquisicoesRacao?.map((ar) => ar.toMap()).toList(),
      'comercializacao_especie': comercializacaoEspecie?.map((ce) => ce.toMap()).toList(),
      'producoes_ornamentais': producoesOrnamentais?.map((pos) => pos.toMap()).toList(),
    };
  }
}
