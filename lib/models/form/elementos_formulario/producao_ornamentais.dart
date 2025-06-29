import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamentais.dart';

class ProducaoOrnamentais {
  final int? id;
  String? uuid;
  String? uuidFormulario;
  final String? ufOrigem;
  final int? unidades;
  final double? quantidade;

  ProducaoOrnamentais({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.unidades,
    this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_producao_ornamentais': id,
      'uuid_producao_ornamentais': uuid,
      'uuid_formulario_producao_ornamentais': uuidFormulario,
      'uf_origem_producao_ornamentais': ufOrigem,
      'unidades_producao_ornamentais': unidades,
      'quantidade_producao_ornamentais': quantidade,
    };
  }

  factory ProducaoOrnamentais.fromMap(Map<String, dynamic> map) {
    return ProducaoOrnamentais(
      id: _parseInt(map['id_producao_ornamentais']),
      uuid: map['uuid_producao_ornamentais'] is String ? map['uuid_producao_ornamentais'] : null,
      uuidFormulario: map['uuid_formulario_producao_ornamentais'] is String ? map['uuid_formulario_producao_ornamentais'] : null,
      ufOrigem: map['uf_origem_producao_ornamentais'] is String ? map['uf_origem_producao_ornamentais'] : null,
      unidades: map['unidades_producao_ornamentais'] is String ? map['unidades_producao_ornamentais'] : null,
      quantidade: _parseDouble(map['quantidade_producao_ornamentais']),
    );
  }

  List<ProducaoOrnamentais> obterProducoes(List<CamposProducaoOrnamentais> producoes) {
    List<ProducaoOrnamentais> listaProducoesOrnamentais = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? ufOrigem = campo.ufOrigemController.text;
      int? unidade = int.tryParse(campo.unidadeController.text);
      double? quantidade = double.tryParse(campo.quantidadeController.text);

      // Criando um objeto Producao e adicionando à lista
      listaProducoesOrnamentais.add(ProducaoOrnamentais(
        ufOrigem: ufOrigem,
        unidades: unidade,
        quantidade: quantidade,
      ));
    }

    return listaProducoesOrnamentais;
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
  }
  else if (value is String) {
    return value.isNotEmpty ? double.tryParse(value) : null;
  }
  return null;
}


