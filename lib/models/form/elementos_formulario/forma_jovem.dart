import 'package:projeto_integrador_mobile/models/campos/campos_forma_jovem.dart';

class FormaJovem {
  String? uuid;
  String? uuidFormulario;
  final String? especie;
  final double? milheiros;

  FormaJovem({this.uuid, this.uuidFormulario, this.especie, this.milheiros});

  Map<String, dynamic> toMap() {
    return{
      'uuid_forma_jovem': uuid,
      'uuid_formulario_forma_jovem': uuidFormulario,
      'especie_forma_jovem': especie,
      'milheiros_forma_jovem': milheiros,
    };
  }

  factory FormaJovem.fromMap(Map<String, dynamic> map) {
    return FormaJovem(
      uuid: map['uuid_forma_jovem'] is String ? map['uuid_forma_jovem'] : null,
      uuidFormulario: map['uuid_formulario_forma_jovem'] is String ? map['uuid_formulario_forma_jovem'] : null,
      especie: map['especie_forma_jovem'] is String ? map['especie_forma_jovem'] : null,
      milheiros: _parseDouble(map['milheiros_forma_jovem']),
    );
  }

  List<FormaJovem> obterFormas(List<CamposFormaJovem> producoes) {
    List<FormaJovem> listaFormasJovem = [];

    for (var campo in producoes) {
      // Obtendo os valores dos controladores
      String? especie = campo.especieController.text;
      double? milheiros = double.tryParse(campo.milheirosController.text);

      // Criando um objeto Producao e adicionando à lista
      listaFormasJovem.add(FormaJovem(
        especie: especie,
        milheiros: milheiros,
      ));
    }

    return listaFormasJovem;
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

