import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/dao/formulario_dao.dart';
import 'package:projeto_integrador_mobile/dao/pessoa_dao.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';
import 'package:projeto_integrador_mobile/service/pessoa_service.dart';

class ListaPessoasComFormulariosPage extends StatefulWidget {
  const ListaPessoasComFormulariosPage({super.key});

  @override
  State<ListaPessoasComFormulariosPage> createState() => _ListaPessoasComFormulariosPageState();
}

class _ListaPessoasComFormulariosPageState extends State<ListaPessoasComFormulariosPage> {
  final PessoaService _pessoaService = PessoaService();
  final FormService _formService = FormService();
  late Future<List<Pessoa>> _pessoas;
  late Future<List<Formulario>> _formularios;

  @override
  void initState() {
    super.initState();
    _formularios = FormService().getForms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulários')),
      body: FutureBuilder<List<Formulario>>(
        future: _formularios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum formulário encontrado.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final formulario = snapshot.data![index];
              return ListTile(
                title: Text(formulario.enderecoEmpre.toString()),
                subtitle: Text(formulario.precoMedio.toString()),
              );
            },
          );
        },
      ),
    );
  }
}