import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_comercializacao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamentais.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/botao_adicionar_item.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/form/cultivo_producao.dart';
import 'package:projeto_integrador_mobile/pages/form/formulario_completo_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';

// Quarta página do formulário, preenche as informações comerciais do empreendimento
class InformacoesComerciaisPage extends StatefulWidget {
  final Pessoa pessoa;
  final Formulario formulario;
  const InformacoesComerciaisPage({super.key, required this.pessoa, required this.formulario});

  @override
  _InformacoesComerciaisPageState createState() => _InformacoesComerciaisPageState();
}

class _InformacoesComerciaisPageState extends State<InformacoesComerciaisPage> {
  final _formKey = GlobalKey<FormState>();
  List<CamposAquisicaoJov> aquisicoesJovemController = [];
  List<CamposAquisicaoRacao> aquisicoesRacaoController = [];
  List<CamposComercializacao> comercializacoesEspecieController = [];
  List<CamposProducaoOrnamentais> producoesOrnamentaisController = [];

  @override
  void initState(){
    super.initState();
    aquisicoesJovemController.add(CamposAquisicaoJov());
    aquisicoesRacaoController.add(CamposAquisicaoRacao());
    comercializacoesEspecieController.add(CamposComercializacao());
    producoesOrnamentaisController.add(CamposProducaoOrnamentais());
  }

  void adicionarAquisicaoJovem() {
    setState(() {
      aquisicoesJovemController.add(CamposAquisicaoJov());
    });
  }

  void removerAquisicaoJovem(int index) {
    setState(() {
      aquisicoesJovemController.removeAt(index);
    });
  }

  void adicionarAquisicaoRacao() {
    setState(() {
      aquisicoesRacaoController.add(CamposAquisicaoRacao());
    });
  }

  void removerAquisicaoRacao(int index) {
    setState(() {
      aquisicoesRacaoController.removeAt(index);
    });
  }

  void adicionarComercializacao() {
    setState(() {
      comercializacoesEspecieController.add(CamposComercializacao());
    });
  }

  void removerComercializacao(int index) {
    setState(() {
      comercializacoesEspecieController.removeAt(index);
    });
  }

  void adicionarProducaoOrnamentais() {
    setState(() {
      producoesOrnamentaisController.add(CamposProducaoOrnamentais());
    });
  }

  void removerProducaoOrnamentais(index) {
    setState(() {
      producoesOrnamentaisController.removeAt(index);
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
        tipoViveiro: widget.formulario.tipoViveiro,
        areaViveiro: widget.formulario.areaViveiro,
        areaTanqueRede: widget.formulario.areaTanqueRede,
        tipoSistemaFechado: widget.formulario.tipoSistemaFechado,
        areaSistemaFechado: widget.formulario.areaSistemaFechado,
        areaRaceway: widget.formulario.areaRaceway,
        producoes: widget.formulario.producoes,
        formasJovem: widget.formulario.formasJovem,
        producoesOrnamental: widget.formulario.producoesOrnamental,
        hasResponsavelTecnico: widget.formulario.hasResponsavelTecnico,
        hasDap: widget.formulario.hasDap,
        hasLicencaAmbiental: widget.formulario.hasLicencaAmbiental,
        hasOutorga: widget.formulario.hasOutorga,
        hasCtf: widget.formulario.hasCtf,
        hasOesa: widget.formulario.hasOesa,
        hasAssistenciaTecnica: widget.formulario.hasAssistenciaTecnica,
        hasViveiro: widget.formulario.hasViveiro,
        hasTanqueRede: widget.formulario.hasTanqueRede,
        hasSistemaFechado: widget.formulario.hasSistemaFechado,
        hasRaceway: widget.formulario.hasRaceway,
        aquisicoesFormaJovem: AquisicaoJovem().obterAquisicoesJovem(aquisicoesJovemController),
        aquisicoesRacao: AquisicaoRacao().obterRacoes(aquisicoesRacaoController),
        comercializacaoEspecie: Comercializacao().obterComercializacoes(comercializacoesEspecieController),
        producoesOrnamentais: ProducaoOrnamentais().obterProducoes(producoesOrnamentaisController)
      );
      try{
        final FormularioService formularioService = FormularioService();
        formularioService.insertFormulario(formulario);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cadastro realizado com sucesso!')),);
      } catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cadastro falhou!')),);
      }

      Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioCompletoPage()));
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
            'Informações Comerciais',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CultivoProducaoPage(pessoa: widget.pessoa, formulario: widget.formulario))
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
                  StepIndicator(currentStep: 2),
                  const SizedBox(height: 24),

                  Row(children: const [Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  Row(children: const [Text('Aquisição de Formas Jovens', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: aquisicoesJovemController.length,
                    itemBuilder: (context, index) {
                      final aquisicaoFormaJovem = aquisicoesJovemController[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Estado de Origem do Fornecedor]", value: "", controller: aquisicaoFormaJovem.ufOrigemController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                              CampoForm(label: "[Espécie Digitada]", value: "", controller: aquisicaoFormaJovem.especieController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                              CampoForm(label: "[Milheiros Digitados]", value: "", controller: aquisicaoFormaJovem.milheirosController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.INTEGER),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerAquisicaoJovem(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Adicionar Aquisição', onPressed: adicionarAquisicaoJovem),
                  const SizedBox(height: 16),

                  Row(children: const [Text('Aquisição de Ração', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: aquisicoesRacaoController.length,
                    itemBuilder: (context, index) {
                      final aquisicaoRacao = aquisicoesRacaoController[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Estado de Origem do Fornecedor]", value: "", controller: aquisicaoRacao.ufOrigemController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                              CampoForm(label: "[Unidades Digitadas]", value: "", controller: aquisicaoRacao.unidadeController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.INTEGER),
                              CampoForm(label: "[Quantidade Digitadas]", value: "", controller: aquisicaoRacao.quantidadeController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.INTEGER),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerAquisicaoRacao(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Adicionar Aquisição', onPressed: adicionarAquisicaoRacao),
                  const SizedBox(height: 16),

                  Row(children: const [Text('Comercialização por espécie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comercializacoesEspecieController.length,
                    itemBuilder: (context, index) {
                      final comercializacaoEspecie = comercializacoesEspecieController[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Estado de Origem do Fornecedor]", value: "", controller: comercializacaoEspecie.ufOrigemController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                              CampoForm(label: "[Espécie Digitada]", value: "", controller: comercializacaoEspecie.especieController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.TEXT),
                              CampoForm(label: "[Produção Comercializada (kg)]", value: "", controller: comercializacaoEspecie.producaoKgController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.DECIMAL),
                              CampoForm(label: "[Quantidade Digitada]", value: "", controller: comercializacaoEspecie.quantidadeController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.INTEGER),
                              CampoForm(label: "[Preço Médio]", value: "", controller: comercializacaoEspecie.precoMedioController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.DECIMAL),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerComercializacao(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Adicionar Aquisição', onPressed: adicionarComercializacao),
                  const SizedBox(height: 16),

                  Row(children: const [Text('Produção de Ornamentais', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: producoesOrnamentaisController.length,
                    itemBuilder: (context, index) {
                      final producaoOrnamentais = producoesOrnamentaisController[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CampoForm(label: "[Estado de Origem do Fornecedor]", value: "", controller: producaoOrnamentais.ufOrigemController, required: true, isEnabled: true, mask: null, lenght: 2, inputType: InputType.TEXT),
                              CampoForm(label: "[Unidades Digitadas]", value: "", controller: producaoOrnamentais.unidadeController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.INTEGER),
                              CampoForm(label: "[Quantidade Digitada]", value: "", controller: producaoOrnamentais.quantidadeController, required: true, isEnabled: true, mask: null, lenght: null, inputType: InputType.INTEGER),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerProducaoOrnamentais(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BotaoAdicionarItem(label: 'Adicionar Produção', onPressed: adicionarProducaoOrnamentais),
                  const SizedBox(height: 16),

                  // Botão "Voltar"
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CultivoProducaoPage(pessoa: widget.pessoa, formulario: widget.formulario,))
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
                            backgroundColor: Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text('Salvar', style: TextStyle(color: Colors.white),),
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
