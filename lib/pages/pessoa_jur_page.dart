import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/ident_aqui_page.dart';
import 'package:projeto_integrador_mobile/pages/ident_empre_page.dart';

class CnpjPage extends StatefulWidget {
  @override
  _CnpjPageState createState() => _CnpjPageState();
}

class _CnpjPageState extends State<CnpjPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _razaoController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _cnaeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();
  final TextEditingController _respController = TextEditingController();
  final TextEditingController _cpfRespController = TextEditingController();
  final TextEditingController _telefoneRespController = TextEditingController();
  final TextEditingController _rgpRespController = TextEditingController();
  final TextEditingController _emailRespController = TextEditingController();

  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
        razaoSocial: _razaoController.text,
        cnpj: _cnpjController.text,
        cnae: _cnaeController.text,
        telefone: int.parse(_telefoneRespController.text),
        email: _emailRespController.text,
        rgp: int.parse(_rgpRespController.text),
        endereco: _enderecoController.text,
        uf: _ufController.text,
        municipio: _municipioController.text,
        nome: _respController.text,
        cpf: _cpfRespController.text
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) => IdentEmprePage(pessoa: pessoa)),);
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
            'Pessoa Jurídica',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => IdentificacaoAquicultorPage())
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
                  const SizedBox(height: 8),
                  // Campo de razão social
                  TextFormField(
                    controller: _razaoController,
                    decoration: InputDecoration(
                      labelText: 'Razão Social',
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

                  // Campo de CNPJ
                  TextFormField(
                    controller: _cnpjController,
                    decoration: InputDecoration(
                      labelText: 'CNPJ',
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

                  // Campo de CNAE
                  TextFormField(
                    controller: _cnaeController,
                    decoration: InputDecoration(
                      labelText: 'Código CNAE principal',
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

                  //Campo de endereço
                  TextFormField(
                    controller: _enderecoController,
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

                  // Campo de município
                  TextFormField(
                    controller: _municipioController,
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
                  ),
                  SizedBox(height: 16),

                  // Campo de UF
                  TextFormField(
                    controller: _ufController,
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

                  // Campo do nome do responsável legal
                  TextFormField(
                    controller: _respController,
                    decoration: InputDecoration(
                      labelText: 'Responsável Legal',
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

                  // Campo do CPF do responsável legal
                  TextFormField(
                    controller: _cpfRespController,
                    decoration: InputDecoration(
                      labelText: 'CPF',
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

                  // Campo do RGP do responsável legal
                  TextFormField(
                    controller: _rgpRespController,
                    decoration: InputDecoration(
                      labelText: 'RGP',
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

                  // Campo do telefone do responsável legal
                  TextFormField(
                    controller: _telefoneRespController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
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

                  // Campo do email do responsável legal
                  TextFormField(
                    controller: _emailRespController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
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
                              context, MaterialPageRoute(builder: (context) => IdentificacaoAquicultorPage())
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
