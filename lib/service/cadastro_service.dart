import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class CadastroService{
  final PessoaDao pessoaDao;
  final FormDao formDao;

  CadastroService(this.pessoaDao, this.formDao);

  Future<void> cadastrarPessoaComFormulario(Pessoa pessoa, Formulario formulario) async {
    int idPessoa = await pessoaDao.insertPessoa(pessoa);

    final formularioComPessoa = formulario.copyWith(idPessoa: idPessoa);

    await formDao.insertForm(formularioComPessoa);
  }
}

