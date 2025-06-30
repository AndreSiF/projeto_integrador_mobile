import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';

class CamposAquisicaoJov{
  final TextEditingController ufOrigemController = TextEditingController();
  final TextEditingController especieController = TextEditingController();
  final TextEditingController milheirosController = TextEditingController();

  List<CamposAquisicaoJov>? obterCamposAquisicaoJovem(List<AquisicaoJovem>? aquisicoes) {
    return aquisicoes?.map((aquisicao) {
      final campos = CamposAquisicaoJov();

      campos.ufOrigemController.text = aquisicao.ufOrigem ?? '';
      campos.especieController.text = aquisicao.especie ?? '';
      campos.milheirosController.text = aquisicao.milheiros?.toStringAsFixed(2) ?? '';

      return campos;
    }).toList();
  }
}