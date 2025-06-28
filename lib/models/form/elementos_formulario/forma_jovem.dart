class FormaJovem {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
  final String? especie;
  final double? milheiros;

  FormaJovem({this.id, this.uuid, this.uuidFormulario, this.especie, this.milheiros});

  Map<String, dynamic> toMap() {
    return{
      'id_forma_jovem': id,
      'uuid_forma_jovem': uuid,
      'uuid_formulario_forma_jovem': uuidFormulario,
      'especie_forma_jovem': especie,
      'milheiros_forma_jovem': milheiros,
    };
  }

  factory FormaJovem.fromMap(Map<String, dynamic> map) {
    return FormaJovem(
      id: _parseInt(map['id_forma_jovem']),
      uuid: map['uuid_forma_jovem'] is String ? map['uuid_forma_jovem'] : null,
      uuidFormulario: map['uuid_formulario_forma_jovem'] is String ? map['uuid_formulario_forma_jovem'] : null,
      especie: map['especie_forma_jovem'] is String ? map['especie_forma_jovem'] : null,
      milheiros: _parseDouble(map['milheiros_forma_jovem']),
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
//           CREATE TABLE forma_jovem (
//             id_forma_jovem INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_forma_jovem TEXT,
//             uuid_formulario_forma_jovem TEXT,
//             especie_forma_jovem TEXT,
//             milheiros_forma_jovem REAL,
//             FOREIGN KEY (uuid_formulario_forma_jovem) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');