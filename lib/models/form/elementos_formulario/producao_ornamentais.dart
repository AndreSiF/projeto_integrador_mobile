import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamentais.dart';

class ProducaoOrnamentais {
  String? uuid;
  String? uuidFormulario;
  final String? ufOrigem;
  final int? unidades;
  final double? quantidade;

  ProducaoOrnamentais({
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.unidades,
    this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return{
      'uuid_producao_ornamentais': uuid,
      'uuid_formulario_producao_ornamentais': uuidFormulario,
      'uf_origem_producao_ornamentais': ufOrigem,
      'unidades_producao_ornamentais': unidades,
      'quantidade_producao_ornamentais': quantidade,
    };
  }

  factory ProducaoOrnamentais.fromMap(Map<String, dynamic> map) {
    return ProducaoOrnamentais(
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
      String? uuid = campo.uuid;
      String? uuidFormulario = campo.uuidFormulario;
      String? ufOrigem = campo.ufOrigemController.text;
      int? unidade = int.tryParse(campo.unidadeController.text);
      double? quantidade = double.tryParse(campo.quantidadeController.text);

      // Criando um objeto Producao e adicionando à lista
      listaProducoesOrnamentais.add(ProducaoOrnamentais(
        uuid: uuid,
        uuidFormulario: uuidFormulario,
        ufOrigem: ufOrigem,
        unidades: unidade,
        quantidade: quantidade,
      ));
    }

    return listaProducoesOrnamentais;
  }
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


