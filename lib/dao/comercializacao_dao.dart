import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:uuid/uuid.dart';

class ComercializacaoDao {
  static const String table = 'comercializacao';

  // DAO que insere comercializacao no banco de dados
  Future<int> insertComercializacao(Comercializacao comercializacao, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    comercializacao.uuid = Uuid().v4();
    comercializacao.uuidFormulario = uuidFormulario;
    return db.insert(table, comercializacao.toMap());
  }

  // DAO que atualiza uma entrada de uma comercializacao no banco de dados
  Future<void> updateComercializacao(Comercializacao? comercializacao) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      comercializacao!.toMap(),
      where: 'uuid_comercializacao = ?',
      whereArgs: [comercializacao.uuid],
    );
  }

  // DAO que retorna uma lista de comercializacões ligadas a um formulário especificado pelo uuid do formulário
  Future<List<Comercializacao>> getComercializacoesByUuidFormulario(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_comercializacao = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return Comercializacao.fromMap(maps[i]);
    });
  }
}