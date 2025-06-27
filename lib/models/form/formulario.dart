import 'dart:ffi';

import 'package:projeto_integrador_mobile/models/form/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/form/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/producao.dart';
import 'package:projeto_integrador_mobile/models/form/producao_ornamentais.dart';

class FormularioN {
  // Pessoa
  final PessoaN pessoa;

  // Responsável Técnico
  final Bool hasResponsavelTecnico;
  final String? nomeResponsavelTecnico;
  final String? registroResponsavelTecnico;
  final String? telefoneResponsavelTecnico;
  final String? emailResponsavelTecnico;

  // Empreendimento
  final String? enderecoEmpreendimento;
  final String? municipioEmpreendimento;
  final String? ufEmpreendimento;

  // Coordenadas Geográficas
  final String? Latitude;
  final String? Longitude;

  // Documentação
  final Bool hasDap;
  final Int? dap;

  final Bool hasLicencaAmbiental;
  final Int? licencaAmbiental;

  final Bool hasOutorga;
  final String? outorga;

  final Bool hasCtf;
  final Int? ctf;

  final Bool hasCar;
  final String? car;

  final Bool hasOesa;
  final Int? oesa;

  final Bool hasAssistenciaTecnica;
  final Int? atendimentosAno;

  // Modelo e Produção
  final Bool hasViveiro;
  final String? tipoViveiro;
  final Double? areaViveiro;

  // Tanque Rede
  final Bool hasTanqueRede;
  final Double? areaTanqueRede;

  // Sistema Fechado
  final Bool hasSistemaFechado;
  final String? tipoSistemaFechado;
  final Double? areaRaceway;

  // Raceway
  final Bool hasRaceway;
  final Double? areaRaceway;

  // Produção
  final List<Producao> producoes;

  // Forma Jovem
  final Double? areaFormaJovem;
  final List<FormaJovem> formasJovem;

  // Ornamental
  final List<Producao> producoesOrnamental;

  // Aquisição de formas jovens
  final List<AquisicaoJovem> aquisicoesFormaJovem;

  // Aquisição de Ração
  final List<AquisicaoRacao> aquisicoesRacao;

  // Comercialização por espécie
  final List<Comercializacao> comercializacaoEspecie;

  // Produção de Ornamentais
  final List<producaoOrnamentais> producoesOrnamentais;

  FormularioN(
    this.pessoa,
    this.hasResponsavelTecnico,
    this.nomeResponsavelTecnico,
    this.registroResponsavelTecnico,
    this.telefoneResponsavelTecnico,
    this.emailResponsavelTecnico,
    this.enderecoEmpreendimento,
    this.municipioEmpreendimento,
    this.ufEmpreendimento,
    this.Latitude,
    this.Longitude,
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
  );
}
