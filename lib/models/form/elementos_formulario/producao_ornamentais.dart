class ProducaoOrnamentais {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
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

// await db.execute('''
//           CREATE TABLE producao_ornamentais (
//             id_producao_ornamentais INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_producao_ornamentais TEXT,
//             uuid_formulario_producao_ornamentais TEXT,
//             uf_origem_producao_ornamentais TEXT,
//             unidades_producao_ornamentais INTEGER,
//             quantidade_producao_ornamentais REAL,
//             FOREIGN KEY (uuid_formulario_producao_ornamentais) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');
