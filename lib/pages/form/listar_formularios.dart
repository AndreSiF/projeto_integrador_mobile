import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:projeto_integrador_mobile/pages/form/visualizar_formulario.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';

// Página que lista todos os formulários completos, unindo o objeto formulário com o objeto pessoa
class ListarFormulariosPage extends StatefulWidget {
  const ListarFormulariosPage({super.key});

  @override
  State<ListarFormulariosPage> createState() => _ListarFormularioPageState();
}

class _ListarFormularioPageState extends State<ListarFormulariosPage> {
  final FormularioService _formularioService = FormularioService();
  late Future<List<Formulario>> _formularios;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    setState(() {
      _formularios = _formularioService.getFormularios();
    });
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
            return const Center(child: Text('Nenhum dado encontrado.'));
          }

          return RefreshIndicator(
            onRefresh: _carregarDados,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                final Pessoa? pessoa = item.pessoa;
                if ((pessoa?.cnpj ?? '').isEmpty){
                  return ListTile(
                    title: Text('Proprietário: ${pessoa?.nome} - ${pessoa?.email}'),
                    subtitle: Text('Endereço da fazenda: ${item.enderecoEmpreendimento}'),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisualizarFormularioPage(dados: item),
                        ),
                      );
                      _carregarDados();
                    },

                  );
                } else {
                  return ListTile(
                    title: Text('Razão Social: ${pessoa?.razaoSocial}'),
                    subtitle: Text('Endereço da fazenda: ${item.enderecoEmpreendimento}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisualizarFormularioPage(dados: item),
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
