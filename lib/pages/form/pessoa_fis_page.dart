import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_aqui_page.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_empre_page.dart';

// Primeira página do formulário (pessoa física), preenche as informações de uma pessoa física
class CpfPage extends StatefulWidget {
  const CpfPage({super.key});

  @override
  _CpfPageState createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _rgpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();

  // Cria o objeto necessário para próxima página e envia o usuário com o objeto para tal página
  void _proximo() {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
        nome: _nomeController.text,
        cpf: _cpfController.text,
        telefone: int.parse(_telefoneController.text),
        email: _emailController.text,
        rgp: int.parse(_rgpController.text),
        endereco: _enderecoController.text,
        uf: _ufController.text,
        municipio: _municipioController.text,
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
          'Pessoa Física',
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
                // Campo de nome
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
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

                // Campo de CPF
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(
                    labelText: 'CPF',
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

                // Campo de telefone
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
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

                //Campo de email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
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

                // Campo de RGP
                TextFormField(
                  controller: _rgpController,
                  decoration: InputDecoration(
                    labelText: 'RGP',
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

                // Campo de enredeço
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
