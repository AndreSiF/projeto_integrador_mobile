import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_integrador_mobile/pages/form/listar_pessoas_formularios_page.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_fis_page.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_jur_page.dart';

class IdentificacaoAquicultorPage extends StatelessWidget {
  const IdentificacaoAquicultorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Identificação Aquicultor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              print('Botão de busca pressionado');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined, color: Colors.black),
            onPressed: () {
              print('Botão de perfil pressionado');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Formulário Anual de\nAtividade Aquícola',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Identificação do Aquicultor',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32),
              Padding(padding: EdgeInsets.only(top: 100)),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CpfPage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D47A1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Pessoa Física', style: TextStyle(fontSize: 16, color: Colors.white)), 
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CnpjPage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D47A1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Pessoa Jurídica', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPessoasComFormulariosPage())),
                  child: Text(
                    'Voltar para o início',
                    style: TextStyle(color: Color(0xFF0D47A1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
