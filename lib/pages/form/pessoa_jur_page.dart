import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_aqui_page.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_empre_page.dart';
import 'package:projeto_integrador_mobile/pages/components/masks.dart';

// Primeira página do formulário (pessoa jurídica) preenche as informações de uma pessoa jurídica
class CnpjPage extends StatefulWidget {
  const CnpjPage({super.key});

  @override
  _CnpjPageState createState() => _CnpjPageState();
}

class _CnpjPageState extends State<CnpjPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _razaoController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _cnaeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();
  final TextEditingController _respController = TextEditingController();
  final TextEditingController _cpfRespController = TextEditingController();
  final TextEditingController _telefoneRespController = TextEditingController();
  final TextEditingController _rgpRespController = TextEditingController();
  final TextEditingController _emailRespController = TextEditingController();

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
        razaoSocial: _razaoController.text,
        cnpj: _cnpjController.text,
        cnae: _cnaeController.text,
        telefone: _telefoneRespController.text,
        email: _emailRespController.text,
        rgp: _rgpRespController.text,
        endereco: _enderecoController.text,
        uf: _ufController.text,
        municipio: _municipioController.text,
        nome: _respController.text,
        cpf: _cpfRespController.text
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
            'Pessoa Jurídica',
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
                  // Campos de informações da empresa e indivíduo CNPJ
                  CampoForm(label: "Razão Social", value: "", controller: _razaoController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "CNPJ", value: "", controller: _cnpjController, required: true, isEnabled: true, mask: [cnpjFormatter], lenght: 18, inputType: InputType.INTEGER),
                  CampoForm(label: "CNAE", value: "", controller: _cnaeController, required: true, isEnabled: true, mask: [cnaeFormatter], lenght: 10, inputType: InputType.INTEGER),
                  CampoForm(label: "Endereço", value: "", controller: _enderecoController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "Município", value: "", controller: _municipioController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "UF", value: "", controller: _ufController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                  CampoForm(label: "Responsável Legal", value: "", controller: _respController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "CPF", value: "", controller: _cpfRespController, required: true, isEnabled: true, mask: [cpfFormatter], lenght: 14, inputType: InputType.INTEGER),
                  CampoForm(label: "RGP", value: "", controller: _rgpRespController, required: true, isEnabled: true, mask: [rgpFormatter], lenght: 10, inputType: InputType.TEXT),
                  CampoForm(label: "Telefone", value: "", controller: _telefoneRespController, required: true, isEnabled: true, mask: [phoneFormatter], lenght: 15, inputType: InputType.INTEGER),
                  CampoForm(label: "E-Mail", value: "", controller: _emailRespController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.EMAIL),

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
