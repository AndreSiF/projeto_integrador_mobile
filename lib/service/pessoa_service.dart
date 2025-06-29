import 'package:projeto_integrador_mobile/dao/old/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';

class PessoaService {
  final PessoaDao _pessoaDao = PessoaDao();

  // Função que retorna todas as pessoas
  Future<List<PessoaOld>> getPessoas() async {
    return await _pessoaDao.getPessoas();
  }

  // Função que deleta uma pessoa baseada em seu ID
  Future<void> deletaPessoa(int id) async{
    await _pessoaDao.deletePessoa(id);
  }

  // Função que atualiza uma entrada da tabela pessoa
  Future<void> updatePessoa(PessoaOld pessoa) async{
    try{
      await _pessoaDao.atualizarPessoa(pessoa);
    }
    catch(e){
      rethrow;
    }
  }
}