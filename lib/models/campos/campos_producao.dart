import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';

class CamposProducao{
  final TextEditingController especieController = TextEditingController();
  final TextEditingController producaoKgController = TextEditingController();
  final TextEditingController unidadesController = TextEditingController();

  List<CamposProducao>? obterCamposProducao(List<Producao>? producoes) {
    return producoes?.map((producao) {
      final campos = CamposProducao();

      campos.especieController.text = producao.especie ?? '';
      campos.producaoKgController.text = producao.producaoKg?.toStringAsFixed(2) ?? '';
      campos.unidadesController.text = producao.unidades?.toString() ?? '';

      return campos;
    }).toList();
  }
}