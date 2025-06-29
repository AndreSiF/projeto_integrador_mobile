import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';
import 'package:uuid/uuid.dart';

class PessoaDaos {
  static const String table = 'aquisicao_racao';

  // DAO que insere aquisição de ração no banco de dados
  Future<int> insertAquisicaoRacao(AquisicaoRacao aquisicaoRacao) async {
    final db = await AppDatabase().database;
    aquisicaoRacao.uuid = Uuid().v4();
    return db.insert(table, aquisicaoRacao.toMap());
  }

  // DAO que atualiza uma entrada de uma aquisicao de ração no banco de dados
  Future<void> atualizarAquisicaoRacao(AquisicaoRacao aquisicaoRacao) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      aquisicaoRacao.toMap(),
      where: 'uuid_aquisicao_racao = ?',
      whereArgs: [aquisicaoRacao.uuid],
    );
  }

  // DAO que retorna uma lista de aquisições ligadas a um formulário especificado pelo uuid do formulário
  Future<List<AquisicaoRacao>> getAquisicoesRacaoByUuidFormulario(String uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_aquisicao_racao = ?',
        whereArgs: [uuid]
    );
    return List.generate(maps.length, (i) {
      return AquisicaoRacao.fromMap(maps[i]);
    });
  }
}