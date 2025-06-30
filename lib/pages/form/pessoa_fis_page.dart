import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/masks.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_aqui_page.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_empre_page.dart';

// Primeira página do formulário (pessoa física), preenche as informações de uma pessoa física
class CpfPage extends StatefulWidget {
  const CpfPage({super.key});

  @override
  _CpfPageState createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _rgpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
        nome: _nomeController.text,
        cpf: _cpfController.text,
        telefone: _telefoneController.text,
        email: _emailController.text,
        rgp: _rgpController.text,
        endereco: _enderecoController.text,
        uf: _ufController.text,
        municipio: _municipioController.text,
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) => IdentEmprePage(pessoa: pessoa)),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F3FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pessoa Física',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => IdentificacaoAquicultorPage())
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {print('Botão de informações pressionado');},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 8),

                // Informações do indivíduo
                CampoForm(label: "Nome Completo", value: "", controller: _nomeController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                CampoForm(label: "CPF", value: "", controller: _cpfController, required: true, isEnabled: true, mask: [cpfFormatter], lenght: 14, inputType: InputType.INTEGER),
                CampoForm(label: "Telefone", value: "", controller: _telefoneController, required: true, isEnabled: true, mask: [phoneFormatter], lenght: 15, inputType: InputType.INTEGER),
                CampoForm(label: "E-Mail", value: "", controller: _emailController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.EMAIL),
                CampoForm(label: "RGP", value: "", controller: _rgpController, required: true, isEnabled: true, mask: [rgpFormatter], lenght: 10, inputType: InputType.TEXT),
                CampoForm(label: "Endereço", value: "", controller: _enderecoController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                CampoForm(label: "UF", value: "", controller: _ufController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                CampoForm(label: "Município", value: "", controller: _municipioController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),

                Row(
                  children: [
                    // Botão "Voltar"
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => IdentificacaoAquicultorPage())
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF0D47A1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Anterior', style: TextStyle(color: Color(0xFF0D47A1)),
                        ),
                      ),
                    ),

                    // Botão "Próximo"
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _proximo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0D47A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Próximo', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
