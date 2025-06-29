import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class PessoaDaos {
  static const String table = 'pessoa';

  // DAO que insere pessoa no banco de dados
  Future<int> insertPessoa(PessoaOld pessoa) async {
    final db = await AppDatabase().database;
    return db.insert(table, pessoa.toMap());
  }

  // DAO que atualiza uma entrada de uma pessoa no banco de dados
  Future<void> atualizarPessoa(PessoaOld pessoa) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      pessoa.toMap(),
      where: 'id_pessoa = ?',
      whereArgs: [pessoa.idPessoa],
    );
  }

  // DAO que retonar todas as entradas de pessoas no bando de dados
  Future<List<PessoaOld>> getPessoas() async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => PessoaOld.fromMap(map)).toList();
  }
}