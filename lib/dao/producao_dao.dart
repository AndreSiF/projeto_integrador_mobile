import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:uuid/uuid.dart';

class PessoaDaos {
  static const String table = 'producao';

  // DAO que insere produção no banco de dados
  Future<int> insertProducao(Producao producao) async {
    final db = await AppDatabase().database;
    producao.uuid = Uuid().v4();
    return db.insert(table, producao.toMap());
  }

  // DAO que atualiza uma entrada de uma producao no banco de dados
  Future<void> atualizarProducao(Producao producao) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      producao.toMap(),
      where: 'uuid_producao = ?',
      whereArgs: [producao.uuid],
    );
  }

  // DAO que retorna uma lista de aquisições ligadas a um formulário especificado pelo uuid do formulário
  Future<List<Producao>> getProducoesByUuidFormulario(String uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_producao = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return Producao.fromMap(maps[i]);
    });
  }
}