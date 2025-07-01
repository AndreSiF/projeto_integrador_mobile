import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_jovem.dart';

class AquisicaoJovem {
  String? uuid;
  String? uuidFormulario;
  final String? ufOrigem;
  final String? especie;
  final double? milheiros;

  AquisicaoJovem({
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.especie,
    this.milheiros,
  });

  Map<String, dynamic> toMap() {
    return{
      'uuid_aquisicao_jovem': uuid,
      'uuid_formulario_aquisicao_jovem': uuidFormulario,
      'uf_origem_aquisicao_jovem': ufOrigem,
      'especie_aquisicao_jovem': especie,
      'milheiros_aquisicao_jovem': milheiros,
    };
  }

  factory AquisicaoJovem.fromMap(Map<String, dynamic> map) {
    return AquisicaoJovem(
      uuid: map['uuid_aquisicao_jovem'] is String ? map['uuid_aquisicao_jovem'] : null,
      uuidFormulario: map['uuid_formulario_aquisicao_jovem'] is String ? map['uuid_formulario_aquisicao_jovem'] : null,
      ufOrigem: map['uf_origem_aquisicao_jovem'] is String ? map['uf_origem_aquisicao_jovem'] : null,
      especie: map['especie_aquisicao_jovem'] is String ? map['especie_aquisicao_jovem'] : null,
      milheiros: _parseDouble(map['milheiros_aquisicao_jovem']),
    );
  }

  List<AquisicaoJovem> obterAquisicoesJovem(List<CamposAquisicaoJov> producoes) {
    List<AquisicaoJovem> listaAquisicaoJovem = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? uuid = campo.uuid;
      String? uuidFormulario = campo.uuidFormulario;
      String? ufOrigem = campo.ufOrigemController.text;
      String? especie = campo.especieController.text;
      double? milheiros = double.tryParse(campo.milheirosController.text);

      // Criando um objeto Producao e adicionando à lista
      listaAquisicaoJovem.add(AquisicaoJovem(
        uuid: uuid,
        uuidFormulario: uuidFormulario,
        ufOrigem: ufOrigem,
        especie: especie,
        milheiros: milheiros,
      ));
    }

    return listaAquisicaoJovem;
  }
}

double? _parseDouble(dynamic value) {
  if (value is double) {
    return value;
  } else if (value is String) {
    return value.isNotEmpty ? double.tryParse(value) : null;
  }
  return null;
}


