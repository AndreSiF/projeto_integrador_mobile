class Producao {
  final int? id;
  final String? uuid;
  final String? especie;
  final double? producaoKg;
  final int? unidades;

  Producao({this.id, this.uuid, this.especie, this.producaoKg, this.unidades});

  Map<String, dynamic> toMap() {
    return {
      'id_producao': id,
      'uuid_producao': uuid,
      'especie_producao': especie,
      'producao_kg_producao': producaoKg,
      'unidades_producao': unidades,
    };
  }

  factory Producao.fromMap(Map<String, dynamic> map) {
    return Producao(
      id: _parseInt(map['id_producao']),
      uuid: map['uuid_producao'] is String ? map['uuid_producao'] : null,
      especie: map['especie_producao'] is String ? map['especie_producao'] : null,
      producaoKg: _parseDouble(map['producao_kg_producao']),
      unidades: _parseInt(map['unidades_producao']),
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
//           CREATE TABLE producao (
//             id_producao INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_producao TEXT,
//             uuid_formulario_producao TEXT,
//             especie_producao TEXT,
//             producao_kg_producao REAL,
//             unidades_producao INTEGER,
//             FOREIGN KEY (uuid_formulario_producao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');
