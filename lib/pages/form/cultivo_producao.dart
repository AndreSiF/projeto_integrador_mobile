import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamental.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamental.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/botao_adicionar_item.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/switch_form_component.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_empre_page.dart';
import 'package:projeto_integrador_mobile/pages/form/info_comerciais_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';

import '../components/masks.dart';

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
  List<CamposFormaJovem> formasJovens = [];
  List<CamposProducaoOrnamental> producoesOrnamental = [];
  final TextEditingController _tipoViveiroController = TextEditingController();
  final TextEditingController _areaViveiroController = TextEditingController();
  final TextEditingController _areaTanqueRedeController = TextEditingController();
  final TextEditingController _tipoSisFechadoController = TextEditingController();
  final TextEditingController _areaSisFechadoController = TextEditingController();
  final TextEditingController _areaRacewayController = TextEditingController();
  final TextEditingController _areaJovProdController = TextEditingController();
  bool _hasViveiro = false;
  bool _hasTanqueRede = false;
  bool _hasSistemaFechado = false;
  bool _hasRaceway = false;

  @override
  void initState(){
    super.initState();
    producoes.add(CamposProducao());
    formasJovens.add(CamposFormaJovem());
    producoesOrnamental.add(CamposProducaoOrnamental());
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

  void adicionarFormaJovem(){
    setState(() {
      formasJovens.add(CamposFormaJovem());
    });
  }

  void removerFormaJovem(int index){
    setState(() {
      formasJovens.removeAt(index);
    });
  }

  void adicionarProducaoOrnamental(){
    setState(() {
      producoesOrnamental.add(CamposProducaoOrnamental());
    });
  }

  void removerProducaoOrnamental(int index){
    setState(() {
      producoesOrnamental.removeAt(index);
    });
  }

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final formulario = Formulario(
        pessoa: widget.pessoa,
        nomeResponsavelTecnico: widget.formulario.nomeResponsavelTecnico,
        registroResponsavelTecnico: widget.formulario.registroResponsavelTecnico,
        telefoneResponsavelTecnico: widget.formulario.telefoneResponsavelTecnico,
        emailResponsavelTecnico: widget.formulario.emailResponsavelTecnico,
        enderecoEmpreendimento: widget.formulario.enderecoEmpreendimento,
        municipioEmpreendimento: widget.formulario.municipioEmpreendimento,
        ufEmpreendimento: widget.formulario.ufEmpreendimento,
        latitude: widget.formulario.latitude,
        longitude: widget.formulario.longitude,
        dap: widget.formulario.dap,
        licencaAmbiental: widget.formulario.licencaAmbiental,
        outorga: widget.formulario.outorga,
        ctf: widget.formulario.ctf,
        car: widget.formulario.car,
        oesa: widget.formulario.oesa,
        atendimentosAno: widget.formulario.atendimentosAno,
        tipoViveiro: _tipoViveiroController.text,
        areaViveiro: double.tryParse(_areaViveiroController.text),
        areaTanqueRede: double.tryParse(_areaTanqueRedeController.text),
        tipoSistemaFechado: _tipoSisFechadoController.text,
        areaSistemaFechado: double.tryParse(_areaSisFechadoController.text),
        areaRaceway: double.tryParse(_areaRacewayController.text),
        areaFormaJovem: double.tryParse(_areaJovProdController.text),
        hasResponsavelTecnico: widget.formulario.hasResponsavelTecnico,
        hasCar: widget.formulario.hasCar,
        hasDap: widget.formulario.hasDap,
        hasLicencaAmbiental: widget.formulario.hasLicencaAmbiental,
        hasOutorga: widget.formulario.hasOutorga,
        hasCtf: widget.formulario.hasCtf,
        hasOesa: widget.formulario.hasOesa,
        hasAssistenciaTecnica: widget.formulario.hasAssistenciaTecnica,
        hasViveiro: _hasViveiro,
        hasTanqueRede: _hasTanqueRede,
        hasSistemaFechado: _hasSistemaFechado,
        hasRaceway: _hasRaceway,
        producoes: Producao().obterProducoes(producoes),
        formasJovem: FormaJovem().obterFormas(formasJovens),
        producoesOrnamental: ProducaoOrnamental().obterProducoes(producoesOrnamental),
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
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasViveiro = val;
                          _tipoViveiroController.clear();
                          _areaViveiroController.clear();
                        });
                      }
                  ), // Informações do viveiro
                  CampoForm(label: "Tipo", value: "", controller: _tipoViveiroController, required: true, isEnabled: _hasViveiro, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "Area total (m³)", value: "", controller: _areaViveiroController, required: true, isEnabled: _hasViveiro , mask: null, lenght: null, inputType: InputType.DECIMAL),

                  SwitchForm(
                      label: 'Tanque Rede',
                      value: _hasTanqueRede,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasTanqueRede = val;
                          _areaTanqueRedeController.clear();
                        });
                      }
                  ), // Área do Tanque Rede
                  CampoForm(label: "Área total (m³)", value: "", controller: _areaTanqueRedeController, required: false, isEnabled: _hasTanqueRede, mask: null, lenght: null, inputType: InputType.DECIMAL),

                  SwitchForm(
                      label: 'Sistema Fechado',
                      value: _hasSistemaFechado,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasSistemaFechado = val;
                          _areaSisFechadoController.clear();
                        });
                      }
                  ), // Sistema Fechado
                  CampoForm(label: "Tipo", value: "", controller: _tipoSisFechadoController, required: true, isEnabled: _hasSistemaFechado, mask: null, lenght: null, inputType: InputType.TEXT),
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaSisFechadoController, required: true, isEnabled: _hasSistemaFechado, mask: null, lenght: null, inputType: InputType.DECIMAL),

                  SwitchForm(
                      label: 'Raceway',
                      value: _hasRaceway,
                      editando: true,
                      onChanged: (val) {
                        setState(() {
                          _hasRaceway = val;
                          _areaRacewayController.clear();
                        });
                      }
                  ), // Área do Raceway
                  CampoForm(label: "Área Total (m³)", value: "", controller: _areaRacewayController, required: false, isEnabled: _hasRaceway, mask: null, lenght: null, inputType: InputType.DECIMAL),

                  Row(children: const [Text('Produção', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: producoes.length,
                      itemBuilder: (context, index) {
                        final producao = producoes[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                CampoForm(label: "[Espécie digitada]", value: "", controller: producao.especieController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                                CampoForm(label: "[Produção (kg) digitada]", value: "", controller: producao.producaoKgController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.DECIMAL),
                                CampoForm(label: "[Unidades (se anfíbio ou réptil)]", value: "", controller: producao.unidadesController, required: true, isEnabled: true, mask: [numberFormatter], lenght: null, inputType: InputType.INTEGER),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => removerProducao(index),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Espécie', onPressed: adicionarProducao),
                  const SizedBox(height: 16),

                  Row(children: const [Text('Forma Jovem', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  CampoForm(label: "Área total de produção (m³)", value: "", controller: _areaJovProdController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.DECIMAL),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: formasJovens.length,
                    itemBuilder: (context, index) {
                      final formaJovem = formasJovens[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Espécie digitada]", value: "", controller: formaJovem.especieController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                              CampoForm(label: "[Milheiros digitado]", value: "", controller: formaJovem.milheirosController, required: true, isEnabled: true, mask: [numberFormatter], lenght: null, inputType: InputType.INTEGER),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerFormaJovem(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Espécie', onPressed: adicionarFormaJovem),
                  const SizedBox(height: 16),

                  Row(children: const [Text('Ornamental', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: producoesOrnamental.length,
                    itemBuilder: (context, index) {
                      final producaoOrnamental = producoesOrnamental[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Espécie digitada]", value: "", controller: producaoOrnamental.especieController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                              CampoForm(label: "[Produção (kg) digitada]", value: "", controller: producaoOrnamental.producaoKgController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.DECIMAL),
                              CampoForm(label: "[Unidades (se anfíbio ou réptil)]", value: "", controller: producaoOrnamental.unidadesController, required: true, isEnabled: true, mask: [numberFormatter], lenght: null, inputType: InputType.INTEGER),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerProducaoOrnamental(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Espécie', onPressed: adicionarProducaoOrnamental),
                  const SizedBox(height: 16),

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
