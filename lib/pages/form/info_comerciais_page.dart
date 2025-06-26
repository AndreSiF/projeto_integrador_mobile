import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_comercializacao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamentais.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/botao_adicionar_item.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_form_component.dart';
import 'package:projeto_integrador_mobile/pages/form/cultivo_producao.dart';
import 'package:projeto_integrador_mobile/pages/form/formulario_completo_page.dart';
import 'package:projeto_integrador_mobile/pages/components/steps/steps_component.dart';
import 'package:projeto_integrador_mobile/service/cadastro_service.dart';

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
  List<CamposAquisicaoJov> aquisicoesJovem = [];
  List<CamposAquisicaoRacao> aquisicoesRacao = [];
  List<CamposComercializacao> comercializacoesEspecie = [];
  List<CamposProducaoOrnamentais> producoesOrnamentais = [];
  final TextEditingController _ufAquiJovController = TextEditingController();
  final TextEditingController _especieAquiJovController = TextEditingController();
  final TextEditingController _milheirosAquiJovController = TextEditingController();
  final TextEditingController _ufOrigemRacaoController = TextEditingController();
  final TextEditingController _unidadesRacaoController = TextEditingController();
  final TextEditingController _quantidadeRacaoController = TextEditingController();
  final TextEditingController _ufOrigemComercEspecieController = TextEditingController();
  final TextEditingController _especieComercialController = TextEditingController();
  final TextEditingController _prodComercialController = TextEditingController();
  final TextEditingController _quantidadeComercialController = TextEditingController();
  final TextEditingController _precoMedioController = TextEditingController();

  @override
  void initState(){
    super.initState();
    aquisicoesJovem.add(CamposAquisicaoJov());
    aquisicoesRacao.add(CamposAquisicaoRacao());
    comercializacoesEspecie.add(CamposComercializacao());
    producoesOrnamentais.add(CamposProducaoOrnamentais());
  }

  void adicionarAquisicaoJovem() {
    setState(() {
      aquisicoesJovem.add(CamposAquisicaoJov());
    });
  }

  void removerAquisicaoJovem(int index) {
    setState(() {
      aquisicoesJovem.removeAt(index);
    });
  }

  void adicionarAquisicaoRacao() {
    setState(() {
      aquisicoesRacao.add(CamposAquisicaoRacao());
    });
  }

  void removerAquisicaoRacao(int index) {
    setState(() {
      aquisicoesRacao.removeAt(index);
    });
  }

  void adicionarComercializacao() {
    setState(() {
      comercializacoesEspecie.add(CamposComercializacao());
    });
  }

  void removerComercializacao(int index) {
    setState(() {
      comercializacoesEspecie.removeAt(index);
    });
  }

  void adicionarProducaoOrnamentais() {
    setState(() {
      producoesOrnamentais.add(CamposProducaoOrnamentais());
    });
  }

  void removerProducaoOrnamentaisint(index) {
    setState(() {
      producoesOrnamentais.removeAt(index);
    });
  }

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
        tipoViveiro: widget.formulario.tipoViveiro,
        areaViveiro: widget.formulario.areaViveiro,
        areaTaqueRede: widget.formulario.areaTaqueRede,
        tipoSistemaFechado: widget.formulario.tipoSistemaFechado,
        areaSistemaFechado: widget.formulario.areaSistemaFechado,
        areaRaceway: widget.formulario.areaRaceway,
        especieProducao: widget.formulario.especieProducao,
        pesoProducao: widget.formulario.pesoProducao,
        unidadesProducao: widget.formulario.unidadesProducao,
        areaJovemProducao: widget.formulario.areaJovemProducao,
        especieAreaJov: widget.formulario.especieAreaJov,
        milheirosAreaJov: widget.formulario.milheirosAreaJov,
        especieOrnamental: widget.formulario.especieOrnamental,
        pesoOrnamental: widget.formulario.pesoOrnamental,
        unidadesOrnamental: widget.formulario.unidadesOrnamental,
        ufAquisicaoJov: _ufAquiJovController.text,
        especieAquiJov: _especieAquiJovController.text,
        milheirosAquiJov: _milheirosAquiJovController.text,
        origemRacao: _ufOrigemRacaoController.text,
        unidadesRacao: int.tryParse(_unidadesRacaoController.text),
        quantidadeRacao: double.tryParse(_quantidadeRacaoController.text),
        ufOrigemComercialEspecie: _ufOrigemComercEspecieController.text,
        especieComercial: _especieComercialController.text,
        prodComercial: double.tryParse(_prodComercialController.text),
        quantidadeComercial: int.tryParse(_quantidadeComercialController.text),
        precoMedio: double.tryParse(_precoMedioController.text),
      );
      try{
        final CadastroService cadastroService = CadastroService();
        cadastroService.cadastrarPessoaComFormulario(widget.pessoa, formulario);
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
                    itemCount: aquisicoesJovem.length,
                    itemBuilder: (context, index) {
                      final aquisicaoFormaJovem = aquisicoesJovem[index];
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
                  // const Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold),),
                  // const SizedBox(height: 16),
                  // const Text('Aquisição de formas jovens', style: TextStyle(fontWeight: FontWeight.bold),),
                  // const SizedBox(height: 16),
                  // CampoForm(label: "Estado de Origem do Fornecedor", value: "", controller: _ufAquiJovController, required: true, enabled: true),
                  // CampoForm(label: "Espécie Digitada", value: "", controller: _especieAquiJovController, required: true, enabled: true),
                  // CampoForm(label: "Milheiros", value: "", controller: _milheirosAquiJovController, required: true, enabled: true),

                  Row(children: const [Text('Aquisição de Ração', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: aquisicoesRacao.length,
                    itemBuilder: (context, index) {
                      final aquisicaoRacao = aquisicoesRacao[index];
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

                  // const Text('Aquisição de ração', style: TextStyle(fontWeight: FontWeight.bold),),
                  // const SizedBox(height: 16),
                  // CampoForm(label: "Estado de Origem do Fornecedor", value: "", controller: _ufOrigemRacaoController, required: true, enabled: true),
                  // CampoForm(label: "Unidades Digitadas", value: "", controller: _unidadesRacaoController, required: true, enabled: true),
                  // CampoForm(label: "Quantidade Digitada", value: "", controller: _quantidadeRacaoController, required: true, enabled: true),

                  Row(children: const [Text('Comercialização por espécie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comercializacoesEspecie.length,
                    itemBuilder: (context, index) {
                      final comercializacaoEspecie = comercializacoesEspecie[index];
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

                  // const Text('Comercialização por espécie', style: TextStyle(fontWeight: FontWeight.bold),),
                  // const SizedBox(height: 16),
                  // CampoForm(label: "Estado de Origem do Fornecedor", value: "", controller: _ufOrigemComercEspecieController, required: true, enabled: true),
                  // CampoForm(label: "Espécie Digitada", value: "", controller: _especieComercialController, required: true, enabled: true),
                  // CampoForm(label: "Produção Comercializada (kg)", value: "", controller: _prodComercialController, required: true, enabled: true),
                  // CampoForm(label: "Quantidade Digitada", value: "", controller: _quantidadeComercialController, required: true, enabled: true),
                  // CampoForm(label: "Preço Médio", value: "", controller: _precoMedioController, required: true, enabled: true),

                  Row(children: const [Text('Produção de Ornamentais', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),],),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: producoesOrnamentais.length,
                    itemBuilder: (context, index) {
                      final producaoOrnamentais = producoesOrnamentais[index];
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
                  BotaoAdicionarItem(label: 'Adicionar Produção', onPressed: adicionarComercializacao),
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
