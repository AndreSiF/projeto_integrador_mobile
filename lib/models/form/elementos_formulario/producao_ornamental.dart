class ProducaoOrnamental {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
  final String? especie;
  final double? producaoKg;
  final int? unidades;

  ProducaoOrnamental({this.id, this.uuid, this.uuidFormulario, this.especie, this.producaoKg, this.unidades});

  Map<String, dynamic> toMap() {
    return{
      'id_producao_ornamental': id,
      'uuid_producao_ornamental': uuid,
      'uuid_formulario_producao_ornamental': uuidFormulario,
      'especie_producao_ornamental': especie,
      'producao_kg_producao_ornamental': producaoKg,
      'unidades_producao_ornamental': unidades,
    };
  }

  factory ProducaoOrnamental.fromMap(Map<String, dynamic> map) {
    return ProducaoOrnamental(
      id: _parseInt(map['id_producao_ornamental']),
      uuid: map['uuid_producao_ornamental'] is String ? map['uuid_producao_ornamental'] : null,
      uuidFormulario: map['uuid_formulario_producao_ornamental'] is String ? map['uuid_formulario_producao_ornamental'] : null,
      especie: map['especie_producao_ornamental'] is String ? map['especie_producao_ornamental'] : null,
      producaoKg: _parseDouble(map['producao_kg_producao_ornamental']),
      unidades: _parseInt(map['unidades_producao_ornamental']),
    );
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

// await db.execute('''
//           CREATE TABLE producao_ornamental (
//             id_producao_ornamental INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_producao_ornamental TEXT,
//             uuid_formulario_producao_ornamental TEXT,
//             especie_producao_ornamental TEXT,
//             producao_kg_producao_ornamental REAL,
//             unidades_producao_ornamental INTEGER,
//             FOREIGN KEY (uuid_formulario_producao_ornamental) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');
