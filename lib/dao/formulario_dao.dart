import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form.dart';

class FormDao {
  static const String table = 'form';

  // DAO que insere um formulário no banco de dados
  Future<int> insertForm(Formulario formulario) async {
    final db = await AppDatabase().database;
    return db.insert(table, formulario.toMap());
  }

  // DAO que deleta um formulário do banco de dados
  Future<void> deleteForm(int id) async {
    final db = await AppDatabase().database;
    await db.delete(table, where: 'id_form = ?', whereArgs: [id]);
  }

  // DAO que retorna todas as entradas de formulários do banco de dados
  Future<List<Formulario>> getForms() async {
    final db = await AppDatabase().database;
    final result = await db.query(table);
    return result.map((map) => Formulario.fromMap(map)).toList();
  }

  // DAO que atualiza uma entrada de formulário do banco de dados
  Future<void> atualizarFormulario(Formulario formulario) async {
    final db = await AppDatabase().database;
    await db.update(
      table,
      formulario.toMap(),
      where: 'id_form = ?',
      whereArgs: [formulario.idForm],
    );
  }

  // DAO que retornar um formulário baseado no ID de uma pessoa
  Future<List<Map<String, dynamic>>> getPessoaComFormulariosRaw() async {
    final db = await AppDatabase().database;
    return await db.rawQuery('''
      SELECT p.*, f.*
      FROM pessoa p
      JOIN form f ON p.id_pessoa = f.id_pessoa
    ''');
  }

}