import 'package:flutter/material.dart';

// Classe de componente usada para o sistema de passos no formulário
class StepIndicator extends StatelessWidget {
  final int currentStep; // índice da etapa atual

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isCompleted = index < currentStep;
        bool isCurrent = index == currentStep;

        return Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: isCompleted
                  ? Colors.green
                  : isCurrent
                  ? Colors.blue[900]
                  : Color(0xFFF9D9F0),
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.white)
                  : Text(
                '${index + 1}',
                style: TextStyle(
                  color: isCurrent ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (index < 2)
              Container(
                width: 40,
                height: 2,
                color: index < currentStep - 1
                    ? Colors.green
                    : Colors.black, // Linha entre os steps
              ),
          ],
        );
      }),
    );
  }
}
