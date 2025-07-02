import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
import 'package:http/http.dart' as http;
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
  final String _baseUrl = "http://10.0.2.2:8080/api/formularios";


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
      print(formulario.pessoa?.nome);
      _pessoaDao.updatePessoa(formulario.pessoa);
      if(formulario.producoes != null){
        for(var producao in formulario.producoes!) {
          _producaoDao.updateProducao(producao);
        }
      }

      if(formulario.producoesOrnamental != null){
        for(var producaoOrnametal in formulario.producoesOrnamental!) {
          _producaoOrnamentalDao.updateProducaoOrnamental(producaoOrnametal);
        }
      }

      if(formulario.producoesOrnamentais != null){
        for(var producaoOrnamentais in formulario.producoesOrnamentais!) {
          _producaoOrnamentaisDao.updateProducaoOrnamentais(producaoOrnamentais);
        }
      }

      if(formulario.aquisicoesFormaJovem != null){
        for(var aquisicaoJovem in formulario.aquisicoesFormaJovem!) {
          _aquisicaoJovemDao.updateAquisicaoJovem(aquisicaoJovem);
        }
      }

      if(formulario.formasJovem != null){
        for(var formaJovem in formulario.formasJovem!){
          _formaJovemDao.updateFormaJovem(formaJovem);
        }
      }

      if(formulario.aquisicoesRacao != null){
        for(var aquisicaoRacao in formulario.aquisicoesRacao!) {
          _aquisicaoRacaoDao.updateAquisicaoRacao(aquisicaoRacao);
        }
      }

      if(formulario.comercializacaoEspecie != null){
        for(var comercializacao in formulario.comercializacaoEspecie!) {
          _comercializacaoDao.updateComercializacao(comercializacao);
        }
      }
    }
    catch(e){
      rethrow;
    }


  }

  Future<void> updateFormularioState(String? uuid) async{
    await _formularioDao.updateFormularioState(uuid);
  }

  Future<bool> sendFormulario(Formulario formulario) async {
    final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formulario.toMapFiltered()));
    return response.statusCode == 200;
  }
}