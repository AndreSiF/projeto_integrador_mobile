import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamental.dart';
import 'package:uuid/uuid.dart';

class ProducaoOrnamentalDao {
  static const String table = 'producao_ornamental';

  // DAO que insere produção ornamental no banco de dados
  Future<int> insertProducaoOrnamental(ProducaoOrnamental producaoOrnamental, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    producaoOrnamental.uuid = Uuid().v4();
    producaoOrnamental.uuidFormulario = uuidFormulario;
    return db.insert(table, producaoOrnamental.toMap());
  }

  // DAO que atualiza uma entrada de uma produção ornamental no banco de dados
  Future<void> updateProducaoOrnamental(ProducaoOrnamental? producaoOrnamental) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      producaoOrnamental!.toMap(),
      where: 'uuid_producao_ornamental = ?',
      whereArgs: [producaoOrnamental.uuid],
    );
  }

  // DAO que retorna uma lista de produções ligadas a um formulário especificado pelo uuid do formulário
  Future<List<ProducaoOrnamental>> getProducoesOrnamentalByUuidFormulario(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_producao_ornamental = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return ProducaoOrnamental.fromMap(maps[i]);
    });
  }
}