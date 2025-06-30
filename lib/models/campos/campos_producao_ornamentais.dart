import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';

class CamposProducaoOrnamentais{
  final TextEditingController ufOrigemController = TextEditingController();
  final TextEditingController unidadeController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  List<CamposProducaoOrnamentais>? obterCamposProducaoOrnamentais(List<ProducaoOrnamentais>? producoes) {
    return producoes?.map((producao) {
      final campos = CamposProducaoOrnamentais();

      campos.ufOrigemController.text = producao.ufOrigem ?? '';
      campos.unidadeController.text = producao.unidades?.toString() ?? '';
      campos.quantidadeController.text = producao.quantidade?.toStringAsFixed(2) ?? '';

      return campos;
    }).toList();
  }
}