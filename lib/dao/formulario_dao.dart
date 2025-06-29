import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:uuid/uuid.dart';

class FormularioDao {
  static const String table = 'formulario';

  // insere uma entrada formulário no banco de dados
  Future<int> insertForm(Formulario formulario) async {
    final db = await AppDatabase().database;
    formulario.uuid = Uuid().v4();
    return db.insert(table, formulario.toMap());
  }
}