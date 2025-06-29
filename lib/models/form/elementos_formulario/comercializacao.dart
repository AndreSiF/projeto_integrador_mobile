import 'package:projeto_integrador_mobile/models/campos/campos_comercializacao.dart';

class Comercializacao {
  final int? id;
  String? uuid;
  String? uuidFormulario;
  final String? ufOrigem;
  final String? especie;
  final double? producaoKg;
  final int? quantidade;
  final double? precoMedio;

  Comercializacao({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.especie,
    this.producaoKg,
    this.quantidade,
    this.precoMedio,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_comercializacao': id,
      'uuid_comercializacao': uuid,
      'uuid_formulario_comercializacao': uuidFormulario,
      'uf_origem_comercializacao': ufOrigem,
      'especie_comercializacao': especie,
      'producao_kg_comercializacao': producaoKg,
      'quantidade_comercializacao': quantidade,
      'preco_medio_comercializacao': precoMedio,
    };
  }

  factory Comercializacao.fromMap(Map<String, dynamic> map) {
    return Comercializacao(
      id: _parseInt(map['id_comercializacao']),
      uuid: map['uuid_comercializacao'] is String ? map['uuid_comercializacao'] : null,
      uuidFormulario: map['uuid_formulario_comercializacao'] is String ? map['uuid_formulario_comercializacao'] : null,
      ufOrigem: map['uf_origem_comercializacao'] is String ? map['uf_origem_comercializacao'] : null,
      especie: map['especie_comercializacao'] is String ? map['especie_comercializacao'] : null,
      producaoKg: _parseDouble(map['producao_kg_comercializacao']),
      quantidade: _parseInt(map['quantidade_comercializacao']),
      precoMedio: _parseDouble(map['preco_medio_comercializacao']),
    );
  }

  List<Comercializacao> obterComercializacoes(List<CamposComercializacao> producoes) {
    List<Comercializacao> listaComercializacao = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? ufOrigem = campo.ufOrigemController.text;
      String? especie = campo.especieController.text;
      double? producaoKg = double.tryParse(campo.producaoKgController.text);
      int? quantidade = int.tryParse(campo.quantidadeController.text);
      double? precoMedio = double.tryParse(campo.precoMedioController.text);

      // Criando um objeto Producao e adicionando à lista
      listaComercializacao.add(Comercializacao(
        ufOrigem: ufOrigem,
        especie: especie,
        producaoKg: producaoKg,
        quantidade: quantidade,
        precoMedio: precoMedio,
      ));
    }

    return listaComercializacao;
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


