import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
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
        unidadesRacao: int.parse(_unidadesRacaoController.text),
        quantidadeRacao: double.parse(_quantidadeRacaoController.text),
        ufOrigemComercialEspecie: _ufOrigemComercEspecieController.text,
        especieComercial: _especieComercialController.text,
        prodComercial: double.parse(_prodComercialController.text),
        quantidadeComercial: int.parse(_quantidadeComercialController.text),
        precoMedio: double.parse(_precoMedioController.text),
      );
      try{
        final CadastroService _cadastroService = CadastroService();
        _cadastroService.cadastrarPessoaComFormulario(widget.pessoa, formulario);
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
                  const Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  const Text('Aquisição de formas jovens', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  // Campo do estado de origem do fornecedor de formas jovens
                  TextFormField(
                    controller: _ufAquiJovController,
                    decoration: InputDecoration(
                      labelText: 'Estado de origem do fornecedor',
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

                  // Campo da espécie forma jovem adiquirida
                  TextFormField(
                    controller: _especieAquiJovController,
                    decoration: InputDecoration(
                      labelText: 'Espécie digitada',
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

                  // Campo dos milheiros de forma jovem
                  TextFormField(
                    controller: _milheirosAquiJovController,
                    decoration: InputDecoration(
                      labelText: 'Milheiros',
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

                  const Text('Aquisição de ração', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  //Campo do estado de origem do fornecedor de ração
                  TextFormField(
                    controller: _ufOrigemRacaoController,
                    decoration: InputDecoration(
                      labelText: 'Estado de origem do fornecedor',
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

                  // Campo das unidades de ração adquirida
                  TextFormField(
                    controller: _unidadesRacaoController,
                    decoration: InputDecoration(
                      labelText: 'Unidades digitadas',
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

                  // Campo da quantidade de ração adquirida
                  TextFormField(
                    controller: _quantidadeRacaoController,
                    decoration: InputDecoration(
                      labelText: 'Quantidade digitada',
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

                  const Text('Comercialização por espécie', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do estado de origem do fornecedor de comercialização por espécie
                  TextFormField(
                    controller: _ufOrigemComercEspecieController,
                    decoration: InputDecoration(
                      labelText: 'Estado de origem do fornecedor',
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

                  // Campo do nome da espécie fornecida
                  TextFormField(
                    controller: _especieComercialController,
                    decoration: InputDecoration(
                      labelText: 'Espécie digitada',
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

                  // Campo da produção em quilos da espécie comercializada
                  TextFormField(
                    controller: _prodComercialController,
                    decoration: InputDecoration(
                      labelText: 'Produção comercializada (kg)',
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
                  ),
                  SizedBox(height: 16),

                  // Campo da quantidade de animais da espécie comercializada
                  TextFormField(
                    controller: _quantidadeComercialController,
                    decoration: InputDecoration(
                      labelText: 'Quantidade digitada',
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

                  // Campo do preço médio da espécie comercializada
                  TextFormField(
                    controller: _precoMedioController,
                    decoration: InputDecoration(
                      labelText: 'Preço Médio',
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
