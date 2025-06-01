import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/ident_empre_page.dart';
import 'package:projeto_integrador_mobile/pages/info_comerciais_page.dart';
import 'package:projeto_integrador_mobile/pages/steps/steps_component.dart';

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
                  StepIndicator(currentStep: 1),
                  const SizedBox(height: 24),
                  const Text('ENGORDA', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  const Text('Modelo e produção', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  // Campo do tipo do viveiro da produção
                  TextFormField(
                    controller: _tipoViveiroController,
                    decoration: InputDecoration(
                      labelText: 'Tipo',
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

                  // Campo da área total do viveiro
                  TextFormField(
                    controller: _areaViveiroController,
                    decoration: InputDecoration(
                      labelText: 'Área Total (m³)',
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

                  const Text('Tanque Rede', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo da área total do tanque rede
                  TextFormField(
                    controller: _areaTanqueRedeController,
                    decoration: InputDecoration(
                      labelText: 'Área Total (m³)',
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

                  const Text('Sistema Fechado', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  //Campo do tipo de sistema fechado
                  TextFormField(
                    controller: _tipoSisFechadoController,
                    decoration: InputDecoration(
                      labelText: 'Tipo',
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

                  // Campo da área do sistema fechado
                  TextFormField(
                    controller: _areaSisFechadoController,
                    decoration: InputDecoration(
                      labelText: 'Área Total (m³)',
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

                  const Text('Raceway', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo da área do raceway
                  TextFormField(
                    controller: _areaRacewayController,
                    decoration: InputDecoration(
                      labelText: 'Área Total (m³)',
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

                  const Text('Produção', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do nome da espécie produzida
                  TextFormField(
                    controller: _especieProdController,
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

                  // Campo do peso da espécie produzida
                  TextFormField(
                    controller: _pesoProdController,
                    decoration: InputDecoration(
                      labelText: 'Produção (kg) digitada',
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

                  // Campo da quantidade de espécies produzidas em unidades
                  TextFormField(
                    controller: _unidadeProdController,
                    decoration: InputDecoration(
                      labelText: 'Unidades (se anfíbio ou réptil)',
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

                  const Text('Forma Jovem', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo da área de produção jovem
                  TextFormField(
                    controller: _areaJovProdController,
                    decoration: InputDecoration(
                      labelText: 'Área Total de Produção (m³)',
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

                  // Campo do nome da espécie na área de produção jovem
                  TextFormField(
                    controller: _especieAreaJovController,
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

                  // Campo dos milheiros da produção de forma jovem
                  TextFormField(
                    controller: _milheirosAreaJovController,
                    decoration: InputDecoration(
                      labelText: 'Milheiros digitados',
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

                  const Text('Ornamental', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),

                  // Campo do nome da espécie ornamental produzida
                  TextFormField(
                    controller: _especieOrnController,
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

                  // Campo do peso da espécie ornamental produzida
                  TextFormField(
                    controller: _pesoOrnController,
                    decoration: InputDecoration(
                      labelText: 'Produção (kg) digitada',
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

                  // Campo da quantidade de espécies ornamentais produzidas
                  TextFormField(
                    controller: _unidadesOrnController,
                    decoration: InputDecoration(
                      labelText: 'Unidades (se anfíbio ou réptil)',
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
