import 'package:flutter/cupertino.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';

class CamposFormaJovem{
  String? uuid;
  String? uuidFormulario;
  final TextEditingController especieController = TextEditingController();
  final TextEditingController milheirosController = TextEditingController();

  List<CamposFormaJovem>? obterCamposFormaJovem(List<FormaJovem>? formas) {
    return formas?.map((forma) {
      final campos = CamposFormaJovem();

      campos.uuid = forma.uuid ?? '';
      campos.uuidFormulario = forma.uuidFormulario ?? '';
      campos.especieController.text = forma.especie ?? '';
      campos.milheirosController.text = forma.milheiros?.toStringAsFixed(2) ?? '';

      return campos;
    }).toList();
  }
}