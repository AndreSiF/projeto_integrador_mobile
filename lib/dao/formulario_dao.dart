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
    final List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Formulario.fromMap(map)).toList();
  }
}