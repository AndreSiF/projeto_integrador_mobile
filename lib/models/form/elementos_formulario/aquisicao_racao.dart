class AquisicaoRacao {
  final int? id;
  final String? uuid;
  final String? uuidFormulario;
  final String? ufOrigem;
  final String? unidade;
  final double? quantidade;

  AquisicaoRacao({
    this.id,
    this.uuid,
    this.uuidFormulario,
    this.ufOrigem,
    this.unidade,
    this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return{
      'id_aquisicao_racao': id,
      'uuid_aquisicao_racao': uuid,
      'uuid_formulario_aquisicao_racao': uuidFormulario,
      'uf_origem_aquisicao_racao': ufOrigem,
      'unidade_aquisicao_racao': unidade,
      'quantidade_aquisicao_racao': quantidade,
    };
  }

  factory AquisicaoRacao.fromMap(Map<String, dynamic> map) {
    return AquisicaoRacao(
      id: _parseInt(map['id_aquisicao_racao']),
      uuid: map['uuid_aquisicao_racao'] is String ? map['uuid_aquisicao_racao'] : null,
      uuidFormulario: map['uuid_formulario_aquisicao_racao'] is String ? map['uuid_formulario_aquisicao_racao'] : null,
      ufOrigem: map['uf_origem_aquisicao_racao'] is String ? map['uf_origem_aquisicao_racao'] : null,
      unidade: map['unidade_aquisicao_racao'] is String ? map['unidade_aquisicao_racao'] : null,
      quantidade: _parseDouble(map['quantidade_aquisicao_racao']),
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
//           CREATE TABLE aquisicao_racao (
//             id_aquisicao_racao INTEGER PRIMARY KEY AUTOINCREMENT,
//             uuid_aquisicao_racao TEXT,
//             uuid_formulario_aquisicao_racao TEXT,
//             uf_origem_aquisicao_racao TEXT,
//             unidade_aquisicao_racao TEXT,
//             quantidade_aquisicao_racao REAL,
//             FOREIGN KEY (uuid_formulario_aquisicao_racao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
//           )
//         ''');