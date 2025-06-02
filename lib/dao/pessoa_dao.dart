import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class PessoaDao {
  static const String table = 'pessoa';

  Future<int> insertPessoa(Pessoa pessoa) async {
    final db = await AppDatabase().database;
    return db.insert(table, pessoa.toMap());
  }

  Future<List<Pessoa>> getPessoas() async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Pessoa.fromMap(map)).toList();
  }

  // Future<List<Map<String, dynamic>>> getPessoasComFormularios() async {
  //   final db = await AppDatabase().database;
  //   return await db.rawQuery('''
  //   SELECT * FROM pessoa
  //   INNER JOIN form ON pessoa.id_pessoa = form.id_pessoa
  // ''');
  // }
}