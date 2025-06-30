import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';
import 'package:uuid/uuid.dart';

class ProducaoOrnamentaisDao {
  static const String table = 'producao_ornamentais';

  // DAO que insere produção ornamentais no banco de dados
  Future<int> insertProducaoOrnamentais(ProducaoOrnamentais producaoOrnamentais, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    producaoOrnamentais.uuid = Uuid().v4();
    producaoOrnamentais.uuidFormulario = uuidFormulario;
    return db.insert(table, producaoOrnamentais.toMap());
  }

  // DAO que atualiza uma entrada de uma producao ornamentais no banco de dados
  Future<void> updateProducaoOrnamentais(ProducaoOrnamentais? producaoOrnamentais) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      producaoOrnamentais!.toMap(),
      where: 'uuid_producao_ornamentais = ?',
      whereArgs: [producaoOrnamentais.uuid],
    );
  }

  // DAO que retorna uma lista de produções ligadas a um formulário especificado pelo uuid do formulário
  Future<List<ProducaoOrnamentais>> getProducoesOrnamentaisByUuidFormulario(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_producao_ornamentais = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return ProducaoOrnamentais.fromMap(maps[i]);
    });
  }
}