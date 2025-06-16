import 'package:flutter/material.dart';

class SwitchForm extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchForm({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
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
          onChanged: onChanged,
          activeColor: Colors.white70,
          activeTrackColor: Colors.blueAccent,
          inactiveThumbColor: Colors.grey.shade700,
          inactiveTrackColor: Colors.grey.shade300,
        ),
      ],
    );
  }
}
