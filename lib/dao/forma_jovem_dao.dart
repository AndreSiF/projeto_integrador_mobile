import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';
import 'package:uuid/uuid.dart';

class FormaJovemDao {
  static const String table = 'forma_jovem';

  // DAO que insere forma jovem no banco de dados
  Future<int> insertFormaJovem(FormaJovem formaJovem, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    formaJovem.uuid = Uuid().v4();
    formaJovem.uuidFormulario = uuidFormulario;
    return db.insert(table, formaJovem.toMap());
  }

  // DAO que atualiza uma entrada de uma forma jovem no banco de dados
  Future<void> updateFormaJovem(FormaJovem? formaJovem) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      formaJovem!.toMap(),
      where: 'uuid_forma_jovem = ?',
      whereArgs: [formaJovem.uuid],
    );
  }

  // DAO que retorna uma lista de formas jovens ligadas a um formulário especificado pelo uuid do formulário
  Future<List<FormaJovem>> getFormasJovemByUuidFormulario(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_forma_jovem = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return FormaJovem.fromMap(maps[i]);
    });
  }
}