import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';

class CamposFormaJovem{
  final TextEditingController especieController = TextEditingController();
  final TextEditingController milheirosController = TextEditingController();

  List<CamposFormaJovem>? obterCamposFormaJovem(List<FormaJovem>? formas) {
    return formas?.map((forma) {
      final campos = CamposFormaJovem();

      campos.especieController.text = forma.especie ?? '';
      campos.milheirosController.text = forma.milheiros?.toStringAsFixed(2) ?? '';

      return campos;
    }).toList();
  }
}