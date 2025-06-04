
import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';

class FormService {
  final FormDao _formDao = FormDao();

  // Função que retorna todos os formulários
  Future<List<Formulario>> getForms() async {
    return await _formDao.getForms();
  }

  // Função que deleta um formulário baseado em seu ID
  Future<void> deletaForm(int id) async{
    await _formDao.deleteForm(id);
  }

  // Função que atualiza uma entrada da tabela do formulário
  Future<void> updateForm(Formulario formulario) async{
    try{
      await _formDao.atualizarFormulario(formulario);
    }
    catch(e){
      rethrow;
    }
  }

  // Função que retorna um objeto que serve como junção de um formulário
  // e de uma pessoa (utilizado para visualização no frontend)
  Future<List<PessoaComFormulario>> getPessoaComFormularios() async {
    final rawData = await _formDao.getPessoaComFormulariosRaw();

    return rawData.map((map) {
      final pessoa = Pessoa.fromMap(map);
      final formulario = Formulario.fromMap(map);
      return PessoaComFormulario(pessoa: pessoa, formulario: formulario);
    }).toList();
  }
}