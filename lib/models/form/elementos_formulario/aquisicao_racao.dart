import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_racao.dart';

class AquisicaoRacao {
  final int? id;
  String? uuid;
  String? uuidFormulario;
  final String? ufOrigem;
  final String? unidade;
  final double? quantidade;

  AquisicaoRacao({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.unidade,
    this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_aquisicao_racao': id,
      'uuid_aquisicao_racao': uuid,
      'uuid_formulario_aquisicao_racao': uuidFormulario,
      'uf_origem_aquisicao_racao': ufOrigem,
      'unidade_aquisicao_racao': unidade,
      'quantidade_aquisicao_racao': quantidade,
    };
  }

  factory AquisicaoRacao.fromMap(Map<String, dynamic> map) {
    return AquisicaoRacao(
      id: _parseInt(map['id_aquisicao_racao']),
      uuid: map['uuid_aquisicao_racao'] is String ? map['uuid_aquisicao_racao'] : null,
      uuidFormulario: map['uuid_formulario_aquisicao_racao'] is String ? map['uuid_formulario_aquisicao_racao'] : null,
      ufOrigem: map['uf_origem_aquisicao_racao'] is String ? map['uf_origem_aquisicao_racao'] : null,
      unidade: map['unidade_aquisicao_racao'] is String ? map['unidade_aquisicao_racao'] : null,
      quantidade: _parseDouble(map['quantidade_aquisicao_racao']),
    );
  }

  List<AquisicaoRacao> obterRacoes(List<CamposAquisicaoRacao> producoes) {
    List<AquisicaoRacao> listaAquisicaoRacao = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? ufOrigem = campo.ufOrigemController.text;
      String? unidade = campo.unidadeController.text;
      double? quantidade = double.tryParse(campo.quantidadeController.text);

      // Criando um objeto Producao e adicionando à lista
      listaAquisicaoRacao.add(AquisicaoRacao(
        ufOrigem: ufOrigem,
        unidade: unidade,
        quantidade: quantidade,
      ));
    }

    return listaAquisicaoRacao;
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

