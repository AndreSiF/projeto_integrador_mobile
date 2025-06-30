import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/dao/aquisicao_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/aquisicao_racao_dao.dart';
import 'package:projeto_integrador_mobile/dao/comercializacao_dao.dart';
import 'package:projeto_integrador_mobile/dao/forma_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamentais_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamental_dao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:uuid/uuid.dart';

class FormularioDao {
  static const String table = 'formulario';

  // insere uma entrada formulário no banco de dados
  Future<void> insertFormulario(Formulario formulario) async {
    final db = await AppDatabase().database;
    //await db.transaction((txn) async {
      String uuidFormulario = Uuid().v4();
      formulario.uuid = uuidFormulario;
      await db.insert(table, formulario.toMap());
      // print(formulario.pessoa?.nome);
      // print(formulario.enderecoEmpreendimento);
      // print(formulario.producoes?.isEmpty);
      // Producao? producao = formulario.producoes?.first;
      // print(producao?.uuidFormulario);
      // print(producao?.especie);
      PessoaDao().insertPessoa(formulario.pessoa, uuidFormulario);
      if(formulario.producoes != null){
        for(var producao in formulario.producoes!) {
          ProducaoDao().insertProducao(producao, uuidFormulario);
        }
      }

      if(formulario.producoesOrnamental != null){
        for(var producaoOrnametal in formulario.producoesOrnamental!) {
          ProducaoOrnamentalDao().insertProducaoOrnamental(producaoOrnametal, uuidFormulario);
        }
      }

      if(formulario.producoesOrnamentais != null){
        for(var producaoOrnamentais in formulario.producoesOrnamentais!) {
          ProducaoOrnamentaisDao().insertProducaoOrnamentais(producaoOrnamentais, uuidFormulario);
        }
      }

      if(formulario.aquisicoesFormaJovem != null){
        for(var aquisicaoJovem in formulario.aquisicoesFormaJovem!) {
          AquisicaoJovemDao().insertAquisicaoJovem(aquisicaoJovem, uuidFormulario);
        }
      }

      if(formulario.formasJovem != null){
        for(var formaJovem in formulario.formasJovem!){
          FormaJovemDao().insertFormaJovem(formaJovem, uuidFormulario);
        }
      }

      if(formulario.aquisicoesRacao != null){
        for(var aquisicaoRacao in formulario.aquisicoesRacao!) {
          AquisicaoRacaoDao().insertAquisicaoRacao(aquisicaoRacao, uuidFormulario);
        }
      }

      if(formulario.comercializacaoEspecie != null){
        for(var comercializacao in formulario.comercializacaoEspecie!) {
          ComercializacaoDao().insertComercializacao(comercializacao, uuidFormulario);
        }
      }
    //});
    return;
  }

  Future<void> deleteFormularioByUuid(String uuid) async {
    final db = await AppDatabase().database;
    await db.delete(
      table,
      where: 'uuid_formulario = ?',
      whereArgs: [uuid]);
  }

  Future<void> updateFormulario(Formulario formulario) async {
    final db = await AppDatabase().database;
    await db.transaction((txn) async {
      await db.update(
        table,
        formulario.toMap(),
        where: 'uuid_formulario = ?',
        whereArgs: [formulario.uuid],
      );
      PessoaDao().updatePessoa(formulario.pessoa);
      if(formulario.producoes != null){
        for(var producao in formulario.producoes!) {
          ProducaoDao().updateProducao(producao);
        }
      }

      if(formulario.producoesOrnamental != null){
        for(var producaoOrnametal in formulario.producoesOrnamental!) {
          ProducaoOrnamentalDao().updateProducaoOrnamental(producaoOrnametal);
        }
      }

      if(formulario.producoesOrnamentais != null){
        for(var producaoOrnamentais in formulario.producoesOrnamentais!) {
          ProducaoOrnamentaisDao().updateProducaoOrnamentais(producaoOrnamentais);
        }
      }

      if(formulario.aquisicoesFormaJovem != null){
        for(var aquisicaoJovem in formulario.aquisicoesFormaJovem!) {
          AquisicaoJovemDao().updateAquisicaoJovem(aquisicaoJovem);
        }
      }

      if(formulario.formasJovem != null){
        for(var formaJovem in formulario.formasJovem!){
          FormaJovemDao().updateFormaJovem(formaJovem);
        }
      }

      if(formulario.aquisicoesRacao != null){
        for(var aquisicaoRacao in formulario.aquisicoesRacao!) {
          AquisicaoRacaoDao().updateAquisicaoRacao(aquisicaoRacao);
        }
      }

      if(formulario.comercializacaoEspecie != null){
        for(var comercializacao in formulario.comercializacaoEspecie!) {
          ComercializacaoDao().updateComercializacao(comercializacao);
        }
      }
    });
  }

  Future<List<Formulario>> getFormularios() async {
    List<Formulario> formularios;
    final db = await AppDatabase().database;
    final result = await db.query(table);
    formularios = result.map((map) => Formulario.fromMap(map)).toList();

    for(var formulario in formularios){
      formulario.pessoa = await PessoaDao().getPessoaByFormularioUuid(formulario.uuid);
      formulario.aquisicoesFormaJovem = await AquisicaoJovemDao().getAquisicoesJovemByUuidFormulario(formulario.uuid);
      formulario.aquisicoesRacao = await AquisicaoRacaoDao().getAquisicoesRacaoByUuidFormulario(formulario.uuid);
      formulario.comercializacaoEspecie = await ComercializacaoDao().getComercializacoesByUuidFormulario(formulario.uuid);
      formulario.formasJovem = await FormaJovemDao().getFormasJovemByUuidFormulario(formulario.uuid);
      formulario.producoes = await ProducaoDao().getProducoesByUuidFormulario(formulario.uuid);
      formulario.producoesOrnamentais = await ProducaoOrnamentaisDao().getProducoesOrnamentaisByUuidFormulario(formulario.uuid);
      formulario.producoesOrnamental = await ProducaoOrnamentalDao().getProducoesOrnamentalByUuidFormulario(formulario.uuid);
      print(formulario.pessoa);
    }

    return formularios;
  }

  Future<void> test() async {
    final db = await AppDatabase().database;

  }
}