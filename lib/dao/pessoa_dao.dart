import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:uuid/uuid.dart';

class PessoaDao {
  static const String table = 'pessoa';

  // DAO que insere pessoa no banco de dados
  Future<int> insertPessoa(Pessoa? pessoa, String? uuidFormulario) async {
    final db = await AppDatabase().database;
    pessoa?.uuid = Uuid().v4();
    pessoa?.uuidFormulario = uuidFormulario;
    return db.insert(table, pessoa!.toMap());
  }

  // DAO que atualiza uma entrada de uma pessoa no banco de dados
  Future<void> updatePessoa(Pessoa? pessoa) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      pessoa!.toMap(),
      where: 'uuid_pessoa = ?',
      whereArgs: [pessoa.uuid],
    );
  }

  // DAO que retorna a pessoa associada a um formulário especificado pelo UUID do formulário
  Future<Pessoa?> getPessoaByFormularioUuid(String? uuid) async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: 'uuid_formulario_pessoa = ?',
        whereArgs: [uuid]
    );
    if (maps.isNotEmpty) {
      return Pessoa.fromMap(maps.first);
    }
    else {
      return null;
    }
  }
  // // DAO que retonar todas as entradas de pessoas no banco de dados
  // Future<List<Pessoa>> getPessoas() async {
  //   final db = await AppDatabase().database;
  //   final List<Map<String, dynamic>> maps = await db.query(table);
  //   return maps.map((map) => Pessoa.fromMap(map)).toList();
  // }
}