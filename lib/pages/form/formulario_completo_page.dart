import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_aqui_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';

// Página que mostra ao usuário que o objeto foi salvo
class FormularioCompletoPage extends StatelessWidget {
  const FormularioCompletoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F3FF),
      appBar: AppBar(
        title: const Text('Informações Comerciais'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => IdentificacaoAquicultorPage())
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              print('Botão de ajuda pressionado'); // Não implementado
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const StepIndicator(currentStep: 3),
          const SizedBox(height: 50),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, color: Colors.white, size: 30),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'FORMULÁRIO SALVO\nCOM SUCESSO NO\nDISPOSITIVO!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
