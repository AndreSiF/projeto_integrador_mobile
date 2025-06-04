import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form.dart';

class FormDao {
  static const String table = 'form';

  Future<int> insertForm(Formulario formulario) async {
    final db = await AppDatabase().database;
    return db.insert(table, formulario.toMap());
  }

  Future<void> deleteForm(int id) async {
    final db = await AppDatabase().database;
    await db.delete('form', where: 'id_form = ?', whereArgs: [id]);
  }

  Future<List<Formulario>> getForms() async {
    final db = await AppDatabase().database;
    final result = await db.query(table);
    return result.map((map) => Formulario.fromMap(map)).toList();
  }

  Future<void> atualizarFormulario(Formulario formulario) async {
    final db = await AppDatabase().database;
    await db.update(
      'form',
      formulario.toMap(),
      where: 'id_form = ?',
      whereArgs: [formulario.idForm],
    );
  }

  Future<List<Map<String, dynamic>>> getPessoaComFormulariosRaw() async {
    final db = await AppDatabase().database;
    return await db.rawQuery('''
      SELECT p.*, f.*
      FROM pessoa p
      JOIN form f ON p.id_pessoa = f.id_pessoa
    ''');
  }

}