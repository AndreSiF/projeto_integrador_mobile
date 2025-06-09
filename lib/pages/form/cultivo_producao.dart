import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_visualizacao_component.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_empre_page.dart';
import 'package:projeto_integrador_mobile/pages/form/info_comerciais_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';

// Terceira página do formulário, serve para informações do cultivo e produção da fazenda
class CultivoProducaoPage extends StatefulWidget {
  final Pessoa pessoa;
  final Formulario formulario;
  const CultivoProducaoPage({super.key, required this.pessoa, required this.formulario});

  @override
  _CultivoProducaoPageState createState() => _CultivoProducaoPageState();
}

class _CultivoProducaoPageState extends State<CultivoProducaoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tipoViveiroController = TextEditingController();
  final TextEditingController _areaViveiroController = TextEditingController();
  final TextEditingController _areaTanqueRedeController = TextEditingController();
  final TextEditingController _tipoSisFechadoController = TextEditingController();
  final TextEditingController _areaSisFechadoController = TextEditingController();
  final TextEditingController _areaRacewayController = TextEditingController();
  final TextEditingController _especieProdController = TextEditingController();
  final TextEditingController _pesoProdController = TextEditingController();
  final TextEditingController _unidadeProdController = TextEditingController();
  final TextEditingController _areaJovProdController = TextEditingController();
  final TextEditingController _especieAreaJovController = TextEditingController();
  final TextEditingController _milheirosAreaJovController = TextEditingController();
  final TextEditingController _especieOrnController = TextEditingController();
  final TextEditingController _pesoOrnController = TextEditingController();
  final TextEditingController _unidadesOrnController = TextEditingController();


  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final formulario = Formulario(
        enderecoEmpre: widget.formulario.enderecoEmpre,
        municipioEmpre: widget.formulario.municipioEmpre,
        ufEmpre: widget.formulario.ufEmpre,
        latitude: widget.formulario.latitude,
        longitude: widget.formulario.longitude,
        dap: widget.formulario.dap,
        cadAmbiental: widget.formulario.cadAmbiental,
        outorga: widget.formulario.outorga,
        ctf: widget.formulario.ctf,
        car: widget.formulario.car,
        oesa: widget.formulario.oesa,
        atendimentosAno: widget.formulario.atendimentosAno,
        tipoViveiro: _tipoViveiroController.text,
        areaViveiro: double.parse(_areaViveiroController.text),
        areaTaqueRede: double.parse(_areaTanqueRedeController.text),
        tipoSistemaFechado: _tipoSisFechadoController.text,
        areaSistemaFechado: double.parse(_areaSisFechadoController.text),
        areaRaceway: double.parse(_areaRacewayController.text),
        especieProducao: _especieProdController.text,
        pesoProducao: double.parse(_pesoProdController.text),
        unidadesProducao: int.parse(_unidadeProdController.text),
        areaJovemProducao: double.parse(_areaJovProdController.text),
        especieAreaJov: _especieAreaJovController.text,
        milheirosAreaJov: _milheirosAreaJovController.text,
        especieOrnamental: _especieOrnController.text,
        pesoOrnamental: double.parse(_pesoOrnController.text),
        unidadesOrnamental: int.parse(_unidadesOrnController.text),
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) => InformacoesComerciaisPage(pessoa: widget.pessoa, formulario: formulario)),);
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
            'Sistema de Cultivo e\nProdução',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => IdentEmprePage(pessoa: widget.pessoa))
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {print('Botão de informações pressionado');}, // Não implementado
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
                  StepIndicator(currentStep: 1),
                  const SizedBox(height: 24),
                  const Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  const Text('Modelo e produção', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Tipo", value: "", controller: _tipoViveiroController, required: true),
                  CampoForm(label: "Area total (m³)", value: "", controller: _areaViveiroController, required: true),

                  const Text('Tanque Rede', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Área total (m³)", value: "", controller: _areaTanqueRedeController, required: false),

                  const Text('Sistema Fechado', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Tipo", value: "", controller: _tipoSisFechadoController, required: true),
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaSisFechadoController, required: true),

                  const Text('Raceway', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaRacewayController, required: false),

                  const Text('Produção', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Espécie Digitada", value: "", controller: _especieProdController, required: true),
                  CampoForm(label: "Produção (kg) Digitada", value: "", controller: _pesoProdController, required: true),
                  CampoForm(label: "Unidades (se anfíbio ou réptil)", value: "", controller: _unidadeProdController, required: true),

                  const Text('Forma Jovem', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Área total de produção (m³)", value: "", controller: _areaJovProdController, required: true),
                  CampoForm(label: "Espécie Digitada", value: "", controller: _especieAreaJovController, required: true),
                  CampoForm(label: "Milheiros Digitados", value: "", controller: _milheirosAreaJovController, required: true),

                  const Text('Ornamental', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Espécie Digitada", value: "", controller: _especieOrnController, required: true),
                  CampoForm(label: "Produção (kg) Digitada", value: "", controller: _pesoOrnController, required: true),
                  CampoForm(label: "Unidades (se anfíbio ou réptil)", value: "", controller: _unidadesOrnController, required: true),
                  
                  // Botão "Voltar"
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => IdentEmprePage(pessoa: widget.pessoa))
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
