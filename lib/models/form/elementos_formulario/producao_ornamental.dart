import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamental.dart';

class ProducaoOrnamental {
  String? uuid;
  String? uuidFormulario;
  final String? especie;
  final double? producaoKg;
  final int? unidades;

  ProducaoOrnamental({this.uuid, this.uuidFormulario, this.especie, this.producaoKg, this.unidades});

  Map<String, dynamic> toMap() {
    return{
      'uuid_producao_ornamental': uuid,
      'uuid_formulario_producao_ornamental': uuidFormulario,
      'especie_producao_ornamental': especie,
      'producao_kg_producao_ornamental': producaoKg,
      'unidades_producao_ornamental': unidades,
    };
  }

  Map<String, dynamic> toMapFiltered() {
    return{
      'especie': especie,
      'producaoKg': producaoKg,
      'unidades': unidades,
    };
  }

  factory ProducaoOrnamental.fromMap(Map<String, dynamic> map) {
    return ProducaoOrnamental(
      uuid: map['uuid_producao_ornamental'] is String ? map['uuid_producao_ornamental'] : null,
      uuidFormulario: map['uuid_formulario_producao_ornamental'] is String ? map['uuid_formulario_producao_ornamental'] : null,
      especie: map['especie_producao_ornamental'] is String ? map['especie_producao_ornamental'] : null,
      producaoKg: _parseDouble(map['producao_kg_producao_ornamental']),
      unidades: _parseInt(map['unidades_producao_ornamental']),
    );
  }

  List<ProducaoOrnamental> obterProducoes(List<CamposProducaoOrnamental> producoes) {
    List<ProducaoOrnamental> listaProducoesOrnamental = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? uuid = campo.uuid;
      String? uuidFormulario = campo.uuidFormulario;
      String? especie = campo.especieController.text;
      double? producaoKg = double.tryParse(campo.producaoKgController.text);
      int? unidades = int.tryParse(campo.unidadesController.text);

      // Criando um objeto Producao e adicionando à lista
      listaProducoesOrnamental.add(ProducaoOrnamental(
        uuid: uuid,
        uuidFormulario: uuidFormulario,
        especie: especie,
        producaoKg: producaoKg,
        unidades: unidades,
      ));
    }

    return listaProducoesOrnamental;
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


