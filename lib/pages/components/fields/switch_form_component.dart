import 'package:flutter/material.dart';

class SwitchForm extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool editando;

  const SwitchForm({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.editando,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Switch(
          value: value,
          onChanged: editando ? onChanged : null,
          activeColor: Colors.white70,
          activeTrackColor: Colors.blueAccent,
          inactiveThumbColor:
          editando ? Colors.grey.shade700 : Colors.grey.shade400,
          inactiveTrackColor:
          editando ? Colors.grey.shade300 : Colors.grey.shade200,
        ),
      ],
    );
  }
}
