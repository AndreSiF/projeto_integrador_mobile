import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form.dart';

class FormDao {
  static const String table = 'form';

  Future<int> insertForm(Formulario formulario) async {
    final db = await AppDatabase().database;
    return db.insert(table, formulario.toMap());
  }

  Future<List<Formulario>> getForms() async {
    final db = await AppDatabase().database;
    final result = await db.query(table);
    return result.map((map) => Formulario.fromMap(map)).toList();
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