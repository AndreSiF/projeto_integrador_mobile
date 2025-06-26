import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum InputType {
  TEXT,
  EMAIL,
  INTEGER,
  DECIMAL,
}

class CampoForm extends StatelessWidget{
  final String label;
  final String? value;
  final TextEditingController? controller;
  final bool required;
  final bool isEnabled;
  final List<MaskTextInputFormatter>? mask;
  final int? lenght;
  final InputType inputType;

  const CampoForm({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
    required this.required,
    required this.isEnabled,
    required this.mask,
    required this.lenght,
    required this.inputType
  });

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;
    
    switch (inputType) {
      case InputType.INTEGER:
        keyboardType = TextInputType.number;
        inputFormatters = null;
        break;
        
      case InputType.EMAIL:
        keyboardType = TextInputType.emailAddress;
        inputFormatters = [FilteringTextInputFormatter.deny(RegExp(r'\s'))];
        break;

      case InputType.DECIMAL:
        keyboardType = TextInputType.numberWithOptions(decimal: true);
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d{0,2}'))];
        break;

      case InputType.TEXT:
        keyboardType = TextInputType.text;
        inputFormatters = null;
        break;
    }
    if(required && isEnabled){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: controller,
          enabled: isEnabled,
          inputFormatters: inputFormatters ?? mask,
          maxLength: lenght,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: isEnabled ? label : '...',
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
          enabled: isEnabled,
          inputFormatters: mask,
          maxLength: lenght,
          decoration: InputDecoration(
            labelText: isEnabled ? label : '...',
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