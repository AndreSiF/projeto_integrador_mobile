import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/form/cultivo_producao.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_fis_page.dart';
import 'package:projeto_integrador_mobile/pages/form/pessoa_jur_page.dart';
import 'package:projeto_integrador_mobile/pages/steps/steps_component.dart';

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
                  const Text('Empreendimento', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  // Campo do endereço do empreendimento
                  TextFormField(
                    controller: _enderecoEmpreController,
                    decoration: InputDecoration(
                      labelText: 'Endereço',
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
                  SizedBox(height: 16),

                  // Campo do municipio do empreendimento
                  TextFormField(
                    controller: _municipioEmpreController,
                    decoration: InputDecoration(
                      labelText: 'Município',
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
                  SizedBox(height: 16),

                  // Campo do estado do empreendimento
                  TextFormField(
                    controller: _ufEmpreController,
                    decoration: InputDecoration(
                      labelText: 'UF',
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
                  SizedBox(height: 16),

                  const Text('Coordenadas Geográficas', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  //Campo da latitude do empreendimento
                  TextFormField(
                    controller: _latitudeController,
                    decoration: InputDecoration(
                      labelText: 'Latitude',
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
                  SizedBox(height: 16),

                  // Campo da longitude do empreendimento
                  TextFormField(
                    controller: _longitudeController,
                    decoration: InputDecoration(
                      labelText: 'Longitude',
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
                  ),
                  SizedBox(height: 16),

                  const Text('Possui Documento de Aptidão ao PRONAF-DAP', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número do cadastro DAP do empreendimento
                  TextFormField(
                    controller: _dapController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ DAP',
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
                  SizedBox(height: 16),

                  const Text('Possui Licença Ambiental', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número do cadastro ambiental do empreedimento
                  TextFormField(
                    controller: _cadAmbientalController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ do Cadastro',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

                  const Text("Possui Outorga de uso d'água", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número da outorga do empreendimento
                  TextFormField(
                    controller: _numOutorgaController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ da Outorga',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

                  const Text('Possui Cadastro Técnico Federal - CTF', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do cadastro do CTF do empreendimento
                  TextFormField(
                    controller: _ctfController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ do Cadastro',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

                  const Text('Possui Cadastro Ambiental Rural - CAR', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número do cadastro do CAR da empresa
                  TextFormField(
                    controller: _carController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ do Cadastro',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

                  const Text('Possui Cadastro na OESA', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número do cadastro da OESA do empreendimento
                  TextFormField(
                    controller: _oesaController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ do Cadastro',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

                  const Text('Possui Assistência Técnica', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do número de atendimentos por ano do técnico do empreedimento.
                  TextFormField(
                    controller: _atendAnoController,
                    decoration: InputDecoration(
                      labelText: 'N⁰ de atendimentos no ano',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6F6A7E)), // cor da borda
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
                  SizedBox(height: 16),

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
