
import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';

class FormService {
  final FormDao _formDao = FormDao();

  Future<List<Formulario>> getForms() async {
    return await _formDao.getForms();
  }
}