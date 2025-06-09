import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/form/cultivo_producao.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_fis_page.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_jur_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';

// Segunda página do formulário, preenche as informações do empreendimento
class IdentEmprePage extends StatefulWidget {
  final Pessoa pessoa;
  const IdentEmprePage({super.key, required this.pessoa});

  @override
  _IdentEmprePageState createState() => _IdentEmprePageState();
}

class _IdentEmprePageState extends State<IdentEmprePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _enderecoEmpreController = TextEditingController();
  final TextEditingController _municipioEmpreController = TextEditingController();
  final TextEditingController _ufEmpreController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _dapController = TextEditingController();
  final TextEditingController _cadAmbientalController = TextEditingController();
  final TextEditingController _numOutorgaController = TextEditingController();
  final TextEditingController _ctfController = TextEditingController();
  final TextEditingController _carController = TextEditingController();
  final TextEditingController _oesaController = TextEditingController();
  final TextEditingController _atendAnoController = TextEditingController();

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final formulario = Formulario(
        enderecoEmpre: _enderecoEmpreController.text,
        municipioEmpre: _municipioEmpreController.text,
        ufEmpre: _ufEmpreController.text,
        latitude: double.parse(_latitudeController.text),
        longitude: double.parse(_longitudeController.text),
        dap: int.parse(_dapController.text),
        cadAmbiental: int.parse(_cadAmbientalController.text),
        outorga: int.parse(_numOutorgaController.text),
        ctf: int.parse(_ctfController.text),
        car: int.parse(_carController.text),
        oesa: int.parse(_oesaController.text),
        atendimentosAno: int.parse(_atendAnoController.text),
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) => CultivoProducaoPage(pessoa: widget.pessoa, formulario: formulario)),);
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
            'Identificação do\nEmpreendimento',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if (widget.pessoa.razaoSocial != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CnpjPage()));
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => CpfPage()));
              }
            }
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
                  StepIndicator(currentStep: 0),
                  const SizedBox(height: 24),
                  const Text('Empreendimento', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold,)),
                  const SizedBox(height: 16),
                  CampoForm(label: "Endereço", value: "", controller: _enderecoEmpreController, required: true),
                  CampoForm(label: "Município", value: "", controller: _municipioEmpreController, required: true),
                  CampoForm(label: "UF", value: "", controller: _ufEmpreController, required: true),

                  const Text('Coordenadas Geográficas', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Latitude", value: "", controller: _latitudeController, required: true),
                  CampoForm(label: "Longitude", value: "", controller: _longitudeController, required: true),

                  const Text('Possui Documento de Aptidão ao PRONAF-DAP', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° DAP", value: "", controller: _dapController, required: false),

                  const Text('Possui Licença Ambiental', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _cadAmbientalController, required: false),

                  const Text("Possui Outorga de uso d'água", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° da Outorga", value: "", controller: _numOutorgaController, required: false),

                  const Text('Possui Cadastro Técnico Federal - CTF', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _ctfController, required: false),

                  const Text('Possui Cadastro Ambiental Rural - CAR', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _carController, required: false),

                  const Text('Possui Cadastro na OESA', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _oesaController, required: false),

                  const Text('Possui Assistência Técnica', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "N° de Atendimentos ao Ano", value: "", controller: _atendAnoController, required: false),


                  // Botão "Voltar"
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            if (widget.pessoa.razaoSocial != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CnpjPage()));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CpfPage()));
                            }
                          },
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
