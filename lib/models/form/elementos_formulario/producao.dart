import 'package:projeto_integrador_mobile/models/campos/campos_producao.dart';

class Producao {
  String? uuid;
  String? uuidFormulario;
  final String? especie;
  final double? producaoKg;
  final int? unidades;

  Producao({this.uuid, this.uuidFormulario, this.especie, this.producaoKg, this.unidades});

  Map<String, dynamic> toMap() {
    return {
      'uuid_producao': uuid,
      'uuid_formulario_producao': uuidFormulario,
      'especie_producao': especie,
      'producao_kg_producao': producaoKg,
      'unidades_producao': unidades,
    };
  }

  Map<String, dynamic> toMapFiltered() {
    return {
      'especie': especie,
      'producaoKg': producaoKg,
      'unidades': unidades,
    };
  }

  factory Producao.fromMap(Map<String, dynamic> map) {
    return Producao(
      uuid: map['uuid_producao'] is String ? map['uuid_producao'] : null,
      uuidFormulario: map['uuid_formulario_producao'] is String ? map['uuid_formulario_producao'] : null,
      especie: map['especie_producao'] is String ? map['especie_producao'] : null,
      producaoKg: _parseDouble(map['producao_kg_producao']),
      unidades: _parseInt(map['unidades_producao']),
    );
  }

  List<Producao> obterProducoes(List<CamposProducao> producoes) {
    List<Producao> listaProducoes = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? uuid = campo.uuid;
      String? uuidFormulario = campo.uuidFormulario;
      String? especie = campo.especieController.text;
      double? producaoKg = double.tryParse(campo.producaoKgController.text);
      int? unidades = int.tryParse(campo.unidadesController.text);

      // Criando um objeto Producao e adicionando à lista
      listaProducoes.add(Producao(
        uuid: uuid,
        uuidFormulario: uuidFormulario,
        especie: especie,
        producaoKg: producaoKg,
        unidades: unidades,
      ));
    }

    return listaProducoes;
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


