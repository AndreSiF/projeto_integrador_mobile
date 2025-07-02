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

  void _confirmarEnvio(Formulario formulario) async {
    final confirmacao = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar envio'),
        content: const Text('Tem certeza que deseja enviar esse formulário para o servidor? (O formulário não poderá mais ser editado após isso)'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Enviar'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmacao == true) {
      _enviarFormulario(formulario);
    }
  }

  void _enviarFormulario(Formulario formulario) async {
    try{
      _formularioService.updateFormularioState(formulario.uuid);
      _formularioService.sendFormulario(formulario);
      _carregarDados();
    }
    catch(e){
      throw Exception('Erro ao enviar formulário ao servidor.');
    }
  }

  void _formularioJaEnviado() async {
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Formulário já enviado'),
        content: const Text('Este formulário já foi enviado ao servidor.'),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
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
                if((pessoa?.cnpj ?? '').isEmpty){
                  return ListTile(
                    title: Text('Proprietário: ${pessoa?.nome}'),
                    subtitle: Text('Endereço da fazenda: ${item.enderecoEmpreendimento}'),
                    trailing: Tooltip(
                      message: item.enviado! ? 'Já enviado' : 'Enviar',
                      child: IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: item.enviado! ? Colors.green : Colors.grey,
                        ),
                        onPressed: () {
                          if (!item.enviado!) {
                            _confirmarEnvio(item);
                          } else {
                            _formularioService.updateFormularioState(item.uuid);
                            _formularioJaEnviado();
                          }
                        },
                      ),
                    ),
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
                }
                else{
                  return ListTile(
                    title: Text('Razão Social: ${pessoa?.razaoSocial}'),
                    subtitle: Text('Endereço da fazenda: ${item.enderecoEmpreendimento}'),
                    trailing: Tooltip(
                      message: item.enviado! ? 'Já enviado' : 'Enviar',
                      child: IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: item.enviado! ? Colors.green : Colors.grey,
                        ),
                        onPressed: () {
                          if (!item.enviado!) {
                            _confirmarEnvio(item);
                          } else {
                            _formularioJaEnviado();
                          }
                        },
                      ),
                    ),
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
                }

              },
            ),
          );
        },
      ),
    );
  }
}
