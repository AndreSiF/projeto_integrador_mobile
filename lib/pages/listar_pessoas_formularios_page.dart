import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';

class ListaPessoasComFormulariosPage extends StatefulWidget {
  const ListaPessoasComFormulariosPage({super.key});

  @override
  State<ListaPessoasComFormulariosPage> createState() => _ListaPessoasComFormulariosPageState();
}

class _ListaPessoasComFormulariosPageState extends State<ListaPessoasComFormulariosPage> {
  final FormService _formService = FormService();
  late Future<List<PessoaComFormulario>> _pessoaComFormularios;

  @override
  void initState() {
    super.initState();
    _pessoaComFormularios = _formService.getPessoaComFormularios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas com Formulários')),
      body: FutureBuilder<List<PessoaComFormulario>>(
        future: _pessoaComFormularios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              final pessoa = item.pessoa;
              final formulario = item.formulario;

              return ListTile(
                title: Text('Nome da pessoa: ${pessoa.nome} - Endereço da Empresa: ${formulario.enderecoEmpre}'),
                subtitle: Text('Preço Médio: ${formulario.precoMedio}'),
              );
            },
          );
        },
      ),
    );
  }
}
