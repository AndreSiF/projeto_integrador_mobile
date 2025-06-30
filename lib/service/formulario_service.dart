import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';

class FormularioService {
  final FormularioDao _formularioDao = FormularioDao();

  Future<void> insertFormulario(Formulario formulario) async {
    await _formularioDao.insertFormulario(formulario);
  }

  Future<List<Formulario>> getFormularios() async {
    return await _formularioDao.getFormularios();
  }

  Future<void> deleteFormulario(String uuid) async {
    await _formularioDao.deleteFormularioByUuid(uuid);
  }

  Future<void> updateFormulario(Formulario formulario) async {
    try{
      await _formularioDao.updateFormulario(formulario);
    }
    catch(e){
      rethrow;
    }
  }
}