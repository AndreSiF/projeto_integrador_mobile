import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/switch_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/masks.dart';
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
  final TextEditingController _nomeRespTecnicoController = TextEditingController();
  final TextEditingController _numRespTecnicoController = TextEditingController();
  final TextEditingController _telefoneRespTecnicoController = TextEditingController();
  final TextEditingController _emailRespTecnicoController = TextEditingController();
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
  bool _hasRespTecnico = false;
  bool _hasDAP = false;
  bool _hasLicencaAmb = false;
  bool _hasOutorga = false;
  bool _hasCTF = false;
  bool _hasCAR = false;
  bool _hasOESA = false;
  bool _hasAssistenciaTecnica = false;

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final formulario = Formulario(
        pessoa: widget.pessoa,
        nomeResponsavelTecnico: _nomeRespTecnicoController.text,
        registroResponsavelTecnico: _numRespTecnicoController.text,
        telefoneResponsavelTecnico: _telefoneRespTecnicoController.text,
        emailResponsavelTecnico: _emailRespTecnicoController.text,
        enderecoEmpreendimento: _enderecoEmpreController.text,
        municipioEmpreendimento: _municipioEmpreController.text,
        ufEmpreendimento: _ufEmpreController.text,
        latitude: _latitudeController.text,
        longitude: _longitudeController.text,
        dap: int.tryParse(_dapController.text),
        licencaAmbiental: int.tryParse(_cadAmbientalController.text),
        outorga: _numOutorgaController.text,
        ctf: int.tryParse(_ctfController.text),
        car: _carController.text,
        oesa: int.tryParse(_oesaController.text),
        atendimentosAno: int.tryParse(_atendAnoController.text),
        hasResponsavelTecnico: _hasRespTecnico,
        hasDap: _hasDAP,
        hasLicencaAmbiental: _hasLicencaAmb,
        hasOutorga: _hasOutorga,
        hasCtf: _hasCTF,
        hasOesa: _hasOESA,
        hasAssistenciaTecnica: _hasAssistenciaTecnica,
      );
      print(formulario.oesa);
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
                  // Informações do Responsável Legal
                  SwitchForm(
                      label: 'Possui responsável técnico',
                      value: _hasRespTecnico,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasRespTecnico = val;
                          _nomeRespTecnicoController.clear();
                          _numRespTecnicoController.clear();
                          _telefoneRespTecnicoController.clear();
                          _emailRespTecnicoController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "Nome Completo", value: "", controller: _nomeRespTecnicoController, required: true, isEnabled: _hasRespTecnico, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "N° do Registro Profissional", value: "", controller: _numRespTecnicoController, required: true, isEnabled: _hasRespTecnico, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "Telefone", value: "", controller: _telefoneRespTecnicoController, required: true, isEnabled: _hasRespTecnico, mask: [phoneFormatter], lenght: 15, inputType: InputType.INTEGER),
                  CampoForm(label: "E-mail", value: "", controller: _emailRespTecnicoController, required: true, isEnabled: _hasRespTecnico, mask: null, lenght: null, inputType: InputType.EMAIL),

                  // Informações do empreendimento
                  const SizedBox(height: 16),
                  Row(children: const [Text('Empreendimento', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  CampoForm(label: "Endereço", value: "", controller: _enderecoEmpreController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "Município", value: "", controller: _municipioEmpreController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "UF", value: "", controller: _ufEmpreController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),

                  const SizedBox(height: 16),
                  Row(children: const [Text('Coordenadas Geográficas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  CampoForm(label: "Latitude", value: "", controller: _latitudeController, required: true, isEnabled: true, mask: [localizacaoFormatter], lenght: 7, inputType: InputType.TEXT),
                  CampoForm(label: "Longitude", value: "", controller: _longitudeController, required: true, isEnabled: true, mask: [localizacaoFormatter], lenght: 7, inputType: InputType.TEXT),

                  SwitchForm(
                      label: 'Possui Documento de\nAptidão ao PRONAF-DAP',
                      value: _hasDAP,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasDAP = val;
                          _dapController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° DAP", value: "", controller: _dapController, required: true, isEnabled: _hasDAP, mask: null, lenght: null, inputType: InputType.TEXT),

                  SwitchForm(
                      label: 'Possui Licença Ambiental',
                      value: _hasLicencaAmb,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasLicencaAmb = val;
                          _cadAmbientalController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _cadAmbientalController, required: true, isEnabled: _hasLicencaAmb, mask: null, lenght: null, inputType: InputType.TEXT),

                  SwitchForm(
                      label: "Possui Outorga de uso d'água",
                      value: _hasOutorga,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasOutorga = val;
                          _numOutorgaController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° da Outorga", value: "", controller: _numOutorgaController, required: true, isEnabled: _hasOutorga, mask: [outorgaFormatter], lenght: 10, inputType: InputType.INTEGER),

                  SwitchForm(
                      label: 'Possui Cadastro Técnico\nFederal - CTF',
                      value: _hasCTF,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasCTF = val;
                          _ctfController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _ctfController, required: true, isEnabled: _hasCTF, mask: [ctfFormatter], lenght: 7, inputType: InputType.INTEGER),

                  SwitchForm(
                      label: 'Possui Cadastro Ambiental\nRural - CAR',
                      value: _hasCAR,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasCAR = val;
                          _carController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _carController, required: true, isEnabled: _hasCAR, mask: null, lenght: null, inputType: InputType.TEXT),

                  SwitchForm(
                      label: 'Possui Cadastro na OESA',
                      value: _hasOESA,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasOESA = val;
                          _oesaController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° do Cadastro", value: "", controller: _oesaController, required: true, isEnabled: _hasOESA, mask: [oesaFormatter], lenght: 6, inputType: InputType.INTEGER),

                  SwitchForm(
                      label: 'Possui Assistência Técnica',
                      value: _hasAssistenciaTecnica,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasAssistenciaTecnica = val;
                          _atendAnoController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "N° de Atendimentos ao Ano", value: "", controller: _atendAnoController, required: true, isEnabled: _hasAssistenciaTecnica, mask: [numberFormatter], lenght: 3, inputType: InputType.INTEGER),

                  Row(
                    children: [
                      // Botão "Voltar"
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
