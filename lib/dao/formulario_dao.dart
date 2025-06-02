import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

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

}