import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class PessoaService {
  final PessoaDao _pessoaDao = PessoaDao();

  Future<List<Pessoa>> getPessoas() async {
    return await _pessoaDao.getPessoas();
  }

  Future<void> updatePessoa(Pessoa pessoa) async{
    try{
      await _pessoaDao.atualizarPessoa(pessoa);
    }
    catch(e){
      rethrow;
    }
  }
}