import 'package:flutter/material.dart';

// Classe usada para criar campos pro frontend de visualização de formulários do banco
// Também libera as caixas de texto quando o usuário aperta no botão de editar
class Campo extends StatelessWidget {
  final String label;
  final String? valor;
  final bool editando;
  final TextEditingController? controller;
  final bool isEnabled;

  const Campo({
    super.key,
    required this.label,
    required this.valor,
    required this.editando,
    required this.controller,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    if (editando) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: isEnabled ? label : '...',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    } else {
      var texto = (valor == null || valor!.trim().isEmpty) ? 'Não consta' : valor!;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          initialValue: texto,
          readOnly: true,
          decoration: InputDecoration(
            labelText: isEnabled ? label : '...',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    }
  }
}