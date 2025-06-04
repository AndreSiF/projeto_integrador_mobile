import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class PessoaDao {
  static const String table = 'pessoa';

  Future<int> insertPessoa(Pessoa pessoa) async {
    final db = await AppDatabase().database;
    return db.insert(table, pessoa.toMap());
  }

  Future<void> deletePessoa(int id) async {
    final db = await AppDatabase().database;
    await db.delete('pessoa', where: 'id_pessoa = ?', whereArgs: [id]);
  }

  Future<void> atualizarPessoa(Pessoa pessoa) async {
    final db = await AppDatabase().database;
    await db.update(
      'pessoa',
      pessoa.toMap(),
      where: 'id_pessoa = ?',
      whereArgs: [pessoa.idPessoa],
    );
  }

  Future<List<Pessoa>> getPessoas() async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Pessoa.fromMap(map)).toList();
  }
}