import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:uuid/uuid.dart';

class AquisicaoJovemDao {
  static const String table = 'aquisicao_jovem';

  // DAO que insere aquisição jovem no banco de dados
  Future<void> insertAquisicaoJovem(AquisicaoJovem aquisicaoJovem, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    aquisicaoJovem.uuid = Uuid().v4();
    aquisicaoJovem.uuidFormulario = uuidFormulario;
    await db.insert(table, aquisicaoJovem.toMap());
    return;
  }

  // DAO que atualiza uma entrada de uma aquisicao jovem no banco de dados
  Future<void> updateAquisicaoJovem(AquisicaoJovem? aquisicaoJovem) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      aquisicaoJovem!.toMap(),
      where: 'uuid_aquisicao_jovem = ?',
      whereArgs: [aquisicaoJovem.uuid],
    );
  }

  // DAO que retorna uma lista de aquisições ligadas a um formulário especificado pelo uuid do formulário
  Future<List<AquisicaoJovem>> getAquisicoesJovemByUuidFormulario(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_aquisicao_jovem = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return AquisicaoJovem.fromMap(maps[i]);
    });
  }
}

// // DAO que retonar todas as entradas de aquisições jovens no banco de dados
// Future<List<AquisicaoJovem>> getAquisicoesJovem() async {
//   final db = await AppDatabase().database;
//   final List<Map<String, dynamic>> maps = await db.query(table);
//   return maps.map((map) => AquisicaoJovem.fromMap(map)).toList();
// }