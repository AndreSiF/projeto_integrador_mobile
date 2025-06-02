import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class CadastroService{
  final PessoaDao _pessoaDao = PessoaDao();
  final FormDao _formDao = FormDao();

  Future<void> cadastrarPessoaComFormulario(Pessoa pessoa, Formulario formulario) async {
    int idPessoa = await _pessoaDao.insertPessoa(pessoa);

    final formularioComPessoa = formulario.copyWith(idPessoa: idPessoa);

    await _formDao.insertForm(formularioComPessoa);
  }
}

