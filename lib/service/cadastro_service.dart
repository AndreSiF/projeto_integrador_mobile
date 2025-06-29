import 'package:projeto_integrador_mobile/dao/old/formulario_dao.dart';
import 'package:projeto_integrador_mobile/dao/old/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class CadastroService{
  final PessoaDao _pessoaDao = PessoaDao();
  final FormDao _formDao = FormDao();

  // Função que cadastra o formulário com a chave estrangeira gerada pela pessoa cadastrada
  Future<void> cadastrarPessoaComFormulario(PessoaOld pessoa, FormularioOld formulario) async {
    int idPessoa = await _pessoaDao.insertPessoa(pessoa);

    final formularioComPessoa = formulario.copyWith(idPessoa: idPessoa);

    await _formDao.insertForm(formularioComPessoa);
  }
}

