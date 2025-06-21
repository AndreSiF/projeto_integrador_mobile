import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/switch_form_component.dart';
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
  List<CamposProducao> producoes = [];
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
  bool _hasViveiro = false;
  bool _hasTanqueRede = false;
  bool _hasSistemaFechado = false;
  bool _hasRaceway = false;

  @override
  void initState(){
    super.initState();
    producoes.add(CamposProducao());
  }

  void adicionarProducao(){
    setState(() {
      producoes.add(CamposProducao());
    });
  }

  void removerProducao(int index){
    setState(() {
      producoes.removeAt(index);
    });
  }

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final formulario = Formulario(
        // TODO: AJUSTAR OS CONTROLLERS
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
        areaViveiro: double.tryParse(_areaViveiroController.text),
        areaTaqueRede: double.tryParse(_areaTanqueRedeController.text),
        tipoSistemaFechado: _tipoSisFechadoController.text,
        areaSistemaFechado: double.tryParse(_areaSisFechadoController.text),
        areaRaceway: double.tryParse(_areaRacewayController.text),
        especieProducao: _especieProdController.text,
        pesoProducao: double.tryParse(_pesoProdController.text),
        unidadesProducao: int.tryParse(_unidadeProdController.text),
        areaJovemProducao: double.tryParse(_areaJovProdController.text),
        especieAreaJov: _especieAreaJovController.text,
        milheirosAreaJov: _milheirosAreaJovController.text,
        especieOrnamental: _especieOrnController.text,
        pesoOrnamental: double.tryParse(_pesoOrnController.text),
        unidadesOrnamental: int.tryParse(_unidadesOrnController.text),
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
                  Row(children: const [Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  Row(children: const [Text('Modelo e Produção', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  SwitchForm(
                      label: 'Viveiro',
                      value: _hasViveiro,
                      onChanged: (val) {
                        setState(() {
                          _hasViveiro = val;
                          _tipoViveiroController.clear();
                          _areaViveiroController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "Tipo", value: "", controller: _tipoViveiroController, required: true, enabled: _hasViveiro),
                  CampoForm(label: "Area total (m³)", value: "", controller: _areaViveiroController, required: true, enabled: _hasViveiro),

                  SwitchForm(
                      label: 'Tanque Rede',
                      value: _hasTanqueRede,
                      onChanged: (val) {
                        setState(() {
                          _hasTanqueRede = val;
                          _areaTanqueRedeController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "Área total (m³)", value: "", controller: _areaTanqueRedeController, required: false, enabled: _hasTanqueRede),

                  SwitchForm(
                      label: 'Sistema Fechado',
                      value: _hasSistemaFechado,
                      onChanged: (val) {
                        setState(() {
                          _hasSistemaFechado = val;
                          _areaSisFechadoController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "Tipo", value: "", controller: _tipoSisFechadoController, required: true, enabled: _hasSistemaFechado),
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaSisFechadoController, required: true, enabled: _hasSistemaFechado),

                  SwitchForm(
                      label: 'Raceway',
                      value: _hasRaceway,
                      onChanged: (val) {
                        setState(() {
                          _hasRaceway = val;
                          _areaRacewayController.clear();
                        });
                      }
                  ),
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaRacewayController, required: false, enabled: _hasRaceway),

                  const Text('Produção', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: producoes.length,
                  //     itemBuilder: (context, index) {
                  //       final producao = producoes[index];
                  //       return Card(
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(16)),
                  //         elevation: 3,
                  //         margin: const EdgeInsets.symmetric(vertical: 8),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(12.0),
                  //           child: Column(
                  //             children: [
                  //               TextFormField(
                  //                 controller: producao.especieController,
                  //                 decoration: const InputDecoration(
                  //                     hintText: 'Espécie digitada'),
                  //               ),
                  //               TextFormField(
                  //                 controller: producao.producaoKgController,
                  //                 decoration: const InputDecoration(
                  //                     hintText: 'Produção (kg) digitada'),
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //               TextFormField(
                  //                 controller: producao.unidadesController,
                  //                 decoration: const InputDecoration(
                  //                     hintText: 'Unidades (se anfíbio ou réptil)'),
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //               const SizedBox(height: 8),
                  //               Align(
                  //                 alignment: Alignment.centerRight,
                  //                 child: IconButton(
                  //                   icon: const Icon(Icons.delete, color: Colors.red),
                  //                   onPressed: () => removerProducao(index),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: adicionarProducao,
                    icon: const Icon(Icons.add),
                    label: const Text('Espécie'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),

                  // CampoForm(label: "Espécie Digitada", value: "", controller: _especieProdController, required: true, enabled: true),
                  // CampoForm(label: "Produção (kg) Digitada", value: "", controller: _pesoProdController, required: true, enabled: true),
                  // CampoForm(label: "Unidades (se anfíbio ou réptil)", value: "", controller: _unidadeProdController, required: true, enabled: true),

                  const Text('Forma Jovem', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Área total de produção (m³)", value: "", controller: _areaJovProdController, required: true, enabled: true),
                  CampoForm(label: "Espécie Digitada", value: "", controller: _especieAreaJovController, required: true, enabled: true),
                  CampoForm(label: "Milheiros Digitados", value: "", controller: _milheirosAreaJovController, required: true, enabled: true),

                  const Text('Ornamental', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  CampoForm(label: "Espécie Digitada", value: "", controller: _especieOrnController, required: true, enabled: true),
                  CampoForm(label: "Produção (kg) Digitada", value: "", controller: _pesoOrnController, required: true, enabled: true),
                  CampoForm(label: "Unidades (se anfíbio ou réptil)", value: "", controller: _unidadesOrnController, required: true, enabled: true),

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
