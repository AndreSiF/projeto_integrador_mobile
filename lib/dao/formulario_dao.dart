import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/dao/aquisicao_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/aquisicao_racao_dao.dart';
import 'package:projeto_integrador_mobile/dao/comercializacao_dao.dart';
import 'package:projeto_integrador_mobile/dao/forma_jovem_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamentais_dao.dart';
import 'package:projeto_integrador_mobile/dao/producao_ornamental_dao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';

class FormularioDao {
  static const String table = 'formulario';

  // insere uma entrada formulário no banco de dados
  Future<void> insertFormulario(Formulario formulario) async {
    final db = await AppDatabase().database;
      await db.insert(table, formulario.toMap());
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
      await db.update(
        table,
        formulario.toMap(),
        where: 'uuid_formulario = ?',
        whereArgs: [formulario.uuid],
      );
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
    }

    return formularios;
  }

  Future<void> test() async {
    // final db = await AppDatabase().database;
    // final result = await db.query('comercializacao');
    // print(result);
    // // List<Comercializacao> comercializacoes = result.map((map) => Comercializacao.fromMap(map)).toList();
    // // for(var comercial in comercializacoes){
    // //   print('tem pelo menos 1 comercial no banco $comercial');
    // //   print(comercial.ufOrigem);
    // //   print(comercial.quantidade);
    // // }
  }
}