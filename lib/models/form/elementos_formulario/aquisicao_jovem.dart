class AquisicaoJovem {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
  final String? ufOrigem;
  final String? especie;
  final double? milheiros;

  AquisicaoJovem({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.especie,
    this.milheiros,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_aquisicao_jovem': id,
      'uuid_aquisicao_jovem': uuid,
      'uuid_formulario_aquisicao_jovem': uuidFormulario,
      'uf_origem_aquisicao_jovem': ufOrigem,
      'especie_aquisicao_jovem': especie,
      'milheiros_aquisicao_jovem': milheiros,
    };
  }

  factory AquisicaoJovem.fromMap(Map<String, dynamic> map) {
    return AquisicaoJovem(
      id: _parseInt(map['id_aquisicao_jovem']),
      uuid: map['uuid_aquisicao_jovem'] is String ? map['uuid_aquisicao_jovem'] : null,
      uuidFormulario: map['uuid_formulario_aquisicao_jovem'] is String ? map['uuid_formulario_aquisicao_jovem'] : null,
      ufOrigem: map['uf_origem_aquisicao_jovem'] is String ? map['uf_origem_aquisicao_jovem'] : null,
      especie: map['especie_aquisicao_jovem'] is String ? map['especie_aquisicao_jovem'] : null,
      milheiros: _parseDouble(map['milheiros_aquisicao_jovem']),
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
//           CREATE TABLE aquisicao_jovem (
//             id_aquisicao_jovem INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_aquisicao_jovem TEXT,
//             uuid_formulario_aquisicao_jovem TEXT,
//             uf_origem_aquisicao_jovem TEXT,
//             especie_aquisicao_jovem TEXT,
//             milheiros_aquisicao_jovem REAL,
//             FOREIGN KEY (uuid_formulario_aquisicao_racao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');
