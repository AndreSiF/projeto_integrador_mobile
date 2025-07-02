import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';

class CamposComercializacao{
  String? uuid;
  String? uuidFormulario;
  final TextEditingController ufOrigemController = TextEditingController();
  final TextEditingController especieController = TextEditingController();
  final TextEditingController producaoKgController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController precoMedioController = TextEditingController();

  List<CamposComercializacao>? obterCamposComercializacao(List<Comercializacao>? comercializacoes) {
    return comercializacoes?.map((comercializacao) {
      final campos = CamposComercializacao();

      campos.uuid = comercializacao.uuid ?? '';
      campos.uuidFormulario = comercializacao.uuidFormulario ?? '';
      campos.ufOrigemController.text = comercializacao.ufOrigem ?? '';
      campos.especieController.text = comercializacao.especie ?? '';
      campos.producaoKgController.text = comercializacao.producaoKg?.toStringAsFixed(2) ?? '';
      campos.quantidadeController.text = comercializacao.quantidade?.toString() ?? '';
      campos.precoMedioController.text = comercializacao.precoMedio?.toStringAsFixed(2) ?? '';

      return campos;
    }).toList();
  }
}