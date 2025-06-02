
import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';

class FormService {
  final FormDao _formDao = FormDao();

  Future<List<Formulario>> getForms() async {
    return await _formDao.getForms();
  }

  Future<List<PessoaComFormulario>> getPessoaComFormularios() async {
    final rawData = await _formDao.getPessoaComFormulariosRaw();

    return rawData.map((map) {
      final pessoa = Pessoa.fromMap(map);
      final formulario = Formulario.fromMap(map);
      return PessoaComFormulario(pessoa: pessoa, formulario: formulario);
    }).toList();
  }
}