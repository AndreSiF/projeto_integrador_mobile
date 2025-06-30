import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';
import 'package:projeto_integrador_mobile/pages/form/visualizar_form.dart';
import 'package:projeto_integrador_mobile/service/old/formulario_service.dart';

// Página que lista todos os formulários completos, unindo o objeto formulário com o objeto pessoa
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
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    setState(() {
      _pessoaComFormularios = _formService.getPessoaComFormularios();
    });
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

          return RefreshIndicator(
            onRefresh: _carregarDados,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                final pessoa = item.pessoa;
                final formulario = item.formulario;

                if ((pessoa.cnpj ?? '').isEmpty){
                  return ListTile(
                    title: Text('Proprietário: ${pessoa.nome} - \nEndereço da fazenda: ${formulario.enderecoEmpre}'),
                    subtitle: Text('Espécie Produzida: ${formulario.especieProducao}'),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisualizarFormPage(dados: item),
                        ),
                      );
                      _carregarDados();
                    },

                  );
                } else {
                  return ListTile(
                    title: Text('Razão Social: ${pessoa.razaoSocial} - Endereço da fazenda: ${formulario.enderecoEmpre}'),
                    subtitle: Text('Espécie Produzida: ${formulario.especieProducao}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisualizarFormPage(dados: item),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
