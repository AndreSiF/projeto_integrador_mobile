import 'package:flutter/material.dart';

class CampoDetalhe extends StatelessWidget {
  final String label;
  final String? valor;

  const CampoDetalhe({
    super.key,
    required this.label,
    this.valor,
  });

  @override
  Widget build(BuildContext context) {
    final texto = (valor == null || valor!.trim().isEmpty) ? 'Não consta' : valor!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        initialValue: texto,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
