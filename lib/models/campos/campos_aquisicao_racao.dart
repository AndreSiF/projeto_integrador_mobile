import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';

class CamposAquisicaoRacao{
  final TextEditingController ufOrigemController = TextEditingController();
  final TextEditingController unidadeController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  List<CamposAquisicaoRacao>? obterCamposAquisicaoRacao(List<AquisicaoRacao>? aquisicoes) {
    return aquisicoes?.map((aquisicao) {
      final campos = CamposAquisicaoRacao();

      campos.ufOrigemController.text = aquisicao.ufOrigem ?? '';
      campos.unidadeController.text = aquisicao.unidade ?? '';
      campos.quantidadeController.text = aquisicao.quantidade?.toString() ?? '';

      return campos;
    }).toList();
  }
}