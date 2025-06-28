class Comercializacao {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
  final String? ufOrigem;
  final String? especie;
  final double? producaoKg;
  final int? quantidade;
  final double? precoMedio;

  Comercializacao({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.especie,
    this.producaoKg,
    this.quantidade,
    this.precoMedio,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_comercializacao': id,
      'uuid_comercializacao': uuid,
      'uuid_formulario_comercializacao': uuidFormulario,
      'uf_origem_comercializacao': ufOrigem,
      'especie_comercializacao': especie,
      'producao_kg_comercializacao': producaoKg,
      'quantidade_comercializacao': quantidade,
      'preco_medio_comercializacao': precoMedio,
    };
  }

  factory Comercializacao.fromMap(Map<String, dynamic> map) {
    return Comercializacao(
      id: _parseInt(map['id_comercializacao']),
      uuid: map['uuid_comercializacao'] is String ? map['uuid_comercializacao'] : null,
      uuidFormulario: map['uuid_formulario_comercializacao'] is String ? map['uuid_formulario_comercializacao'] : null,
      ufOrigem: map['uf_origem_comercializacao'] is String ? map['uf_origem_comercializacao'] : null,
      especie: map['especie_comercializacao'] is String ? map['especie_comercializacao'] : null,
      producaoKg: _parseDouble(map['producao_kg_comercializacao']),
      quantidade: _parseInt(map['quantidade_comercializacao']),
      precoMedio: _parseDouble(map['preco_medio_comercializacao']),
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
//           CREATE TABLE comercializacao (
//             id_comercializacao INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_comercializacao TEXT,
//             uuid_formulario_comercializacao TEXT,
//             uf_origem_comercializacao TEXT,
//             especie_comercializacao TEXT,
//             producao_kg_comercializacao REAL,
//             quantidade_comercializacao INTEGER,
//             preco_medio_comercializacao REAL,
//             FOREIGN KEY (uuid_formulario_comercializacao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');
