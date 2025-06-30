import 'package:projeto_integrador_mobile/dao/aquisicao_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/aquisicao_racao_dao.dart';
import 'package:projeto_integrador_mobile/dao/comercializacao_dao.dart';
import 'package:projeto_integrador_mobile/dao/forma_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamentais_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamental_dao.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:uuid/uuid.dart';

class FormularioService {
  final FormularioDao _formularioDao = FormularioDao();
  final PessoaDao _pessoaDao = PessoaDao();
  final ProducaoDao _producaoDao = ProducaoDao();
  final ProducaoOrnamentalDao _producaoOrnamentalDao = ProducaoOrnamentalDao();
  final ProducaoOrnamentaisDao _producaoOrnamentaisDao = ProducaoOrnamentaisDao();
  final AquisicaoJovemDao _aquisicaoJovemDao = AquisicaoJovemDao();
  final FormaJovemDao _formaJovemDao = FormaJovemDao();
  final AquisicaoRacaoDao _aquisicaoRacaoDao = AquisicaoRacaoDao();
  final ComercializacaoDao _comercializacaoDao = ComercializacaoDao();


  Future<void> insertFormulario(Formulario formulario) async {
    String uuidFormulario = Uuid().v4();
    formulario.uuid = uuidFormulario;
    await _formularioDao.insertFormulario(formulario);

    await _pessoaDao.insertPessoa(formulario.pessoa, uuidFormulario);

    if(formulario.producoes != null){
      for(var producao in formulario.producoes!) {
        await _producaoDao.insertProducao(producao, uuidFormulario);
      }
    }

    if(formulario.producoesOrnamental != null){
      for(var producaoOrnametal in formulario.producoesOrnamental!) {
        await _producaoOrnamentalDao.insertProducaoOrnamental(producaoOrnametal, uuidFormulario);
      }
    }

    if(formulario.producoesOrnamentais != null){
      for(var producaoOrnamentais in formulario.producoesOrnamentais!) {
        await _producaoOrnamentaisDao.insertProducaoOrnamentais(producaoOrnamentais, uuidFormulario);
      }
    }

    if(formulario.aquisicoesFormaJovem != null){
      for(var aquisicaoJovem in formulario.aquisicoesFormaJovem!) {
        await _aquisicaoJovemDao.insertAquisicaoJovem(aquisicaoJovem, uuidFormulario);
      }
    }

    if(formulario.formasJovem != null){
      for(var formaJovem in formulario.formasJovem!){
        await _formaJovemDao.insertFormaJovem(formaJovem, uuidFormulario);
      }
    }

    if(formulario.aquisicoesRacao != null){
      for(var aquisicaoRacao in formulario.aquisicoesRacao!) {
        await _aquisicaoRacaoDao.insertAquisicaoRacao(aquisicaoRacao, uuidFormulario);
      }
    }

    if(formulario.comercializacaoEspecie != null){
      for(var comercializacao in formulario.comercializacaoEspecie!) {
        await _comercializacaoDao.insertComercializacao(comercializacao, uuidFormulario);
      }
    }
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