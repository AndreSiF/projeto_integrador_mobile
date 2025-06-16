import 'package:flutter/material.dart';

class CampoForm extends StatelessWidget{
  final String label;
  final String? value;
  final TextEditingController? controller;
  final bool required;
  final bool enabled;

  const CampoForm({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
    required this.required,
    required this.enabled
  });

  @override
  Widget build(BuildContext context) {
    if(required && enabled){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: enabled ? label : '...',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6F6A7E)),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6F6A7E), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            labelStyle: TextStyle(color: Color(0xFF6F6A7E)),
          ),
          validator: (value) =>
          value == null || value.isEmpty ? 'Campo obrigatório' : null,
        ),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: enabled ? label : '...',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6F6A7E)),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x806F6A7E)),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6F6A7E), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            labelStyle: TextStyle(color: Color(0xFF6F6A7E)),
          ),
        ),
      );
    }
  }
}