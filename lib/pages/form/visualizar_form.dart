import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/form.dart';
import 'package:projeto_integrador_mobile/models/pessoa.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';
import 'package:projeto_integrador_mobile/pages/fields/campo_visualizacao_component.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';
import 'package:projeto_integrador_mobile/service/pessoa_service.dart';

// Página que serve para visualizar um formulário específico
class VisualizarFormPage extends StatefulWidget {
  final PessoaComFormulario dados;

  const VisualizarFormPage({super.key, required this.dados});

  @override
  State<VisualizarFormPage> createState() => _VisualizarFormPageState();
}

class _VisualizarFormPageState extends State<VisualizarFormPage> {
  bool _editando = false;
  late Pessoa pessoa;
  late Formulario formulario;

  // Pessoa
  late TextEditingController _nomeController;
  late TextEditingController _cpfController;
  late TextEditingController _telefoneController;
  late TextEditingController _emailController;
  late TextEditingController _rgpController;
  late TextEditingController _ufController;
  late TextEditingController _municipioController;
  late TextEditingController _enderecoController;
  late TextEditingController _razaoSocialController;
  late TextEditingController _cnpjController;
  late TextEditingController _cnaeController;

  // Formulario
  late TextEditingController _enderecoEmpreController;
  late TextEditingController _municipioEmpreController;
  late TextEditingController _ufEmpreController;
  late TextEditingController _latitudeController;
  late TextEditingController _longitudeController;
  late TextEditingController _dapController;
  late TextEditingController _cadAmbientalController;
  late TextEditingController _outorgaController;
  late TextEditingController _ctfController;
  late TextEditingController _carController;
  late TextEditingController _oesaController;
  late TextEditingController _atendimentosAnoController;

  late TextEditingController _tipoViveiroController;
  late TextEditingController _areaViveiroController;
  late TextEditingController _areaTaqueRedeController;
  late TextEditingController _tipoSistemaFechadoController;
  late TextEditingController _areaSistemaFechadoController;
  late TextEditingController _areaRacewayController;
  late TextEditingController _especieProducaoController;
  late TextEditingController _pesoProducaoController;
  late TextEditingController _unidadesProducaoController;
  late TextEditingController _areaJovemProducaoController;
  late TextEditingController _especieAreaJovController;
  late TextEditingController _milheirosAreaJovController;
  late TextEditingController _especieOrnamentalController;
  late TextEditingController _pesoOrnamentalController;
  late TextEditingController _unidadesOrnamentalController;

  late TextEditingController _ufAquisicaoJovController;
  late TextEditingController _especieAquiJovController;
  late TextEditingController _milheirosAquiJovController;
  late TextEditingController _origemRacaoController;
  late TextEditingController _unidadesRacaoController;
  late TextEditingController _quantidadeRacaoController;
  late TextEditingController _ufOrigemComercialEspecieController;
  late TextEditingController _especieComercialController;
  late TextEditingController _prodComercialController;
  late TextEditingController _quantidadeComercialController;
  late TextEditingController _precoMedioController;


  @override
  void initState() {
    super.initState();
    pessoa = widget.dados.pessoa;
    formulario = widget.dados.formulario;

    // Pessoa
    _nomeController = TextEditingController(text: pessoa.nome ?? '');
    _cpfController = TextEditingController(text: pessoa.cpf ?? '');
    _telefoneController = TextEditingController(text: pessoa.telefone?.toString() ?? '');
    _emailController = TextEditingController(text: pessoa.email ?? '');
    _rgpController = TextEditingController(text: pessoa.rgp?.toString() ?? '');
    _ufController = TextEditingController(text: pessoa.uf ?? '');
    _municipioController = TextEditingController(text: pessoa.municipio ?? '');
    _enderecoController = TextEditingController(text: pessoa.endereco ?? '');
    _razaoSocialController = TextEditingController(text: pessoa.razaoSocial ?? '');
    _cnpjController = TextEditingController(text: pessoa.cnpj ?? '');
    _cnaeController = TextEditingController(text: pessoa.cnae ?? '');

    // Formulario
    _enderecoEmpreController = TextEditingController(text: formulario.enderecoEmpre ?? '');
    _municipioEmpreController = TextEditingController(text: formulario.municipioEmpre ?? '');
    _ufEmpreController = TextEditingController(text: formulario.ufEmpre ?? '');
    _latitudeController = TextEditingController(text: formulario.latitude?.toString() ?? '');
    _longitudeController = TextEditingController(text: formulario.longitude?.toString() ?? '');
    _dapController = TextEditingController(text: formulario.dap?.toString() ?? '');
    _cadAmbientalController = TextEditingController(text: formulario.cadAmbiental?.toString() ?? '');
    _outorgaController = TextEditingController(text: formulario.outorga?.toString() ?? '');
    _ctfController = TextEditingController(text: formulario.ctf?.toString() ?? '');
    _carController = TextEditingController(text: formulario.car?.toString() ?? '');
    _oesaController = TextEditingController(text: formulario.oesa?.toString() ?? '');
    _atendimentosAnoController = TextEditingController(text: formulario.atendimentosAno?.toString() ?? '');

    _tipoViveiroController = TextEditingController(text: formulario.tipoViveiro ?? '');
    _areaViveiroController = TextEditingController(text: formulario.areaViveiro?.toString() ?? '');
    _areaTaqueRedeController = TextEditingController(text: formulario.areaTaqueRede?.toString() ?? '');
    _tipoSistemaFechadoController = TextEditingController(text: formulario.tipoSistemaFechado ?? '');
    _areaSistemaFechadoController = TextEditingController(text: formulario.areaSistemaFechado?.toString() ?? '');
    _areaRacewayController = TextEditingController(text: formulario.areaRaceway?.toString() ?? '');
    _especieProducaoController = TextEditingController(text: formulario.especieProducao ?? '');
    _pesoProducaoController = TextEditingController(text: formulario.pesoProducao?.toString() ?? '');
    _unidadesProducaoController = TextEditingController(text: formulario.unidadesProducao?.toString() ?? '');
    _areaJovemProducaoController = TextEditingController(text: formulario.areaJovemProducao?.toString() ?? '');
    _especieAreaJovController = TextEditingController(text: formulario.especieAreaJov ?? '');
    _milheirosAreaJovController = TextEditingController(text: formulario.milheirosAreaJov ?? '');
    _especieOrnamentalController = TextEditingController(text: formulario.especieOrnamental ?? '');
    _pesoOrnamentalController = TextEditingController(text: formulario.pesoOrnamental?.toString() ?? '');
    _unidadesOrnamentalController = TextEditingController(text: formulario.unidadesOrnamental?.toString() ?? '');

    _ufAquisicaoJovController = TextEditingController(text: formulario.ufAquisicaoJov ?? '');
    _especieAquiJovController = TextEditingController(text: formulario.especieAquiJov ?? '');
    _milheirosAquiJovController = TextEditingController(text: formulario.milheirosAquiJov ?? '');
    _origemRacaoController = TextEditingController(text: formulario.origemRacao ?? '');
    _unidadesRacaoController = TextEditingController(text: formulario.unidadesRacao?.toString() ?? '');
    _quantidadeRacaoController = TextEditingController(text: formulario.quantidadeRacao?.toString() ?? '');
    _ufOrigemComercialEspecieController = TextEditingController(text: formulario.ufOrigemComercialEspecie ?? '');
    _especieComercialController = TextEditingController(text: formulario.especieComercial ?? '');
    _prodComercialController = TextEditingController(text: formulario.prodComercial?.toString() ?? '');
    _quantidadeComercialController = TextEditingController(text: formulario.quantidadeComercial?.toString() ?? '');
    _precoMedioController = TextEditingController(text: formulario.precoMedio?.toString() ?? '');
  }

  // Cria uma caixa para confirmar a exclusão de uma entrada da tabela para o usuário
  void _confirmarExclusao() async {
    final confirmacao = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Tem certeza que deseja excluir este formulário?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Excluir'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmacao == true) {
      _excluirRegistro();
    }
  }

  // Exclui o formulário do banco de dados
  void _excluirRegistro() async {
    final _formService = FormService();
    final _pessoaService = PessoaService();

    try {
      await _formService.deletaForm(widget.dados.formulario.idForm!);
      await _pessoaService.deletaPessoa(widget.dados.pessoa.idPessoa!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário excluído com sucesso.')),
      );

      Navigator.of(context).pop(); // Volta para a tela anterior
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao excluir: $e')),
      );
    }
  }

  // Salva alterações feitas em um formulário para o banco de dados
  void _salvarAlteracoes() async {
    final pessoaAtualizada = Pessoa(
      idPessoa: pessoa.idPessoa,
      nome: _nomeController.text,
      cpf: _cpfController.text,
      telefone: int.tryParse(_telefoneController.text),
      email: _emailController.text,
      rgp: int.tryParse(_rgpController.text),
      uf: _ufController.text,
      municipio: _municipioController.text,
      endereco: _enderecoController.text,
      razaoSocial: _razaoSocialController.text,
      cnpj: _cnpjController.text,
      cnae: _cnaeController.text,
    );

    final formularioAtualizado = Formulario(
      idForm: formulario.idForm,
      idPessoa: formulario.idPessoa,
      enderecoEmpre: _enderecoEmpreController.text,
      municipioEmpre: _municipioEmpreController.text,
      ufEmpre: _ufEmpreController.text,
      latitude: double.tryParse(_latitudeController.text),
      longitude: double.tryParse(_longitudeController.text),
      dap: int.tryParse(_dapController.text),
      cadAmbiental: int.tryParse(_cadAmbientalController.text),
      outorga: int.tryParse(_outorgaController.text),
      ctf: int.tryParse(_ctfController.text),
      car: int.tryParse(_carController.text),
      oesa: int.tryParse(_oesaController.text),
      atendimentosAno: int.tryParse(_atendimentosAnoController.text),
      tipoViveiro: _tipoViveiroController.text,
      areaViveiro: double.tryParse(_areaViveiroController.text),
      areaTaqueRede: double.tryParse(_areaTaqueRedeController.text),
      tipoSistemaFechado: _tipoSistemaFechadoController.text,
      areaSistemaFechado: double.tryParse(_areaSistemaFechadoController.text),
      areaRaceway: double.tryParse(_areaRacewayController.text),
      especieProducao: _especieProducaoController.text,
      pesoProducao: double.tryParse(_pesoProducaoController.text),
      unidadesProducao: int.tryParse(_unidadesProducaoController.text),
      areaJovemProducao: double.tryParse(_areaJovemProducaoController.text),
      especieAreaJov: _especieAreaJovController.text,
      milheirosAreaJov: _milheirosAreaJovController.text,
      especieOrnamental: _especieOrnamentalController.text,
      pesoOrnamental: double.tryParse(_pesoOrnamentalController.text),
      unidadesOrnamental: int.tryParse(_unidadesOrnamentalController.text),
      ufAquisicaoJov: _ufAquisicaoJovController.text,
      especieAquiJov: _especieAquiJovController.text,
      milheirosAquiJov: _milheirosAquiJovController.text,
      origemRacao: _origemRacaoController.text,
      unidadesRacao: int.tryParse(_unidadesRacaoController.text),
      quantidadeRacao: double.tryParse(_quantidadeRacaoController.text),
      ufOrigemComercialEspecie: _ufOrigemComercialEspecieController.text,
      especieComercial: _especieComercialController.text,
      prodComercial: double.tryParse(_prodComercialController.text),
      quantidadeComercial: int.tryParse(_quantidadeComercialController.text),
      precoMedio: double.tryParse(_precoMedioController.text),
    );

    final FormService _formService = FormService();
    final PessoaService _pessoaService = PessoaService();

    await _pessoaService.updatePessoa(pessoaAtualizada);
    await _formService.updateForm(formularioAtualizado);

    setState(() {
      _editando = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dados atualizados com sucesso')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Formulário'),
        actions: [
          IconButton(
            icon: Icon(_editando ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                _editando = !_editando;
              });
            },
          ),
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _confirmarExclusao
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dados da Pessoa
            const Text('Dados do Indivíduo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Nome', valor: pessoa.nome, controller: _nomeController, editando: _editando),
            Campo(label: 'CPF', valor: pessoa.cpf, controller: _cpfController, editando: _editando),
            Campo(label: 'Telefone', valor: pessoa.telefone?.toString(), controller: _telefoneController, editando: _editando),
            Campo(label: 'Email', valor: pessoa.email, controller: _emailController, editando: _editando),
            Campo(label: 'RGP', valor: pessoa.rgp?.toString(), controller: _rgpController, editando: _editando),
            Campo(label: 'UF', valor: pessoa.uf, controller: _ufController, editando: _editando),
            Campo(label: 'Município', valor: pessoa.municipio, controller: _municipioController, editando: _editando),
            Campo(label: 'Endereço', valor: pessoa.endereco, controller: _enderecoController, editando: _editando),
            Campo(label: 'Razão Social', valor: pessoa.razaoSocial, controller: _razaoSocialController, editando: _editando),
            Campo(label: 'CNPJ', valor: pessoa.cnpj, controller: _cnpjController, editando: _editando),
            Campo(label: 'CNAE', valor: pessoa.cnae, controller: _cnaeController, editando: _editando),

            // Dados da Fazenda
            const SizedBox(height: 24),
            const Text('Empreendimento', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Endereço', valor: formulario.enderecoEmpre, controller: _enderecoEmpreController, editando: _editando),
            Campo(label: 'Município', valor: formulario.municipioEmpre, controller: _municipioEmpreController, editando: _editando),
            Campo(label: 'UF', valor: formulario.ufEmpre, controller: _ufEmpreController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Coordenadas Geográficas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Latitude', valor: formulario.latitude?.toString(), controller: _latitudeController, editando: _editando),
            Campo(label: 'Longitude', valor: formulario.longitude?.toString(), controller: _longitudeController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Número do DAP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'N° DAP', valor: formulario.dap?.toString(), controller: _dapController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Possui Licença Ambiental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'N° do Cadastro', valor: formulario.cadAmbiental?.toString(), controller: _cadAmbientalController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Número da Outorga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'N° da Outorga', valor: formulario.outorga?.toString(), controller: _outorgaController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Número do Cadastro Técnico Federal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'CTF', valor: formulario.ctf?.toString(), controller: _ctfController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Número do Cadastro Ambiental Rural', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'CAR', valor: formulario.car?.toString(), controller: _carController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Número do cadastro na OESA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'OESA', valor: formulario.oesa?.toString(), controller: _oesaController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Antedimentos Técnicos por Ano', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Atendimentos no Ano', valor: formulario.atendimentosAno?.toString(), controller: _atendimentosAnoController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Viveiro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Tipo Viveiro', valor: formulario.tipoViveiro, controller: _tipoViveiroController, editando: _editando),
            Campo(label: 'Área Viveiro', valor: formulario.areaViveiro?.toString(), controller: _areaViveiroController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Tanque rede', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Área Taque Rede', valor: formulario.areaTaqueRede?.toString(), controller: _areaTaqueRedeController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Sistema Fechado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Tipo Sistema Fechado', valor: formulario.tipoSistemaFechado, controller: _tipoSistemaFechadoController, editando: _editando),
            Campo(label: 'Área Sistema Fechado', valor: formulario.areaSistemaFechado?.toString(), controller: _areaSistemaFechadoController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Raceway', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Área Raceway', valor: formulario.areaRaceway?.toString(), controller: _areaRacewayController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Produção', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Espécie', valor: formulario.especieProducao, controller: _especieProducaoController, editando: _editando),
            Campo(label: 'Peso', valor: formulario.pesoProducao?.toString(), controller: _pesoProducaoController, editando: _editando),
            Campo(label: 'Unidades', valor: formulario.unidadesProducao?.toString(), controller: _unidadesProducaoController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Forma Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Área (m³)', valor: formulario.areaJovemProducao?.toString(), controller: _areaJovemProducaoController, editando: _editando),
            Campo(label: 'Espécie', valor: formulario.especieAreaJov, controller: _especieAreaJovController, editando: _editando),
            Campo(label: 'Milheiros', valor: formulario.milheirosAreaJov, controller: _milheirosAreaJovController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Ornamental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Espécie', valor: formulario.especieOrnamental, controller: _especieOrnamentalController, editando: _editando),
            Campo(label: 'Peso', valor: formulario.pesoOrnamental?.toString(), controller: _pesoOrnamentalController, editando: _editando),
            Campo(label: 'Unidades', valor: formulario.unidadesOrnamental?.toString(), controller: _unidadesOrnamentalController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Aquisição de Formas Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Estado de Origem do Fornecedor', valor: formulario.ufAquisicaoJov, controller: _ufAquisicaoJovController, editando: _editando),
            Campo(label: 'Espécie', valor: formulario.especieAquiJov, controller: _especieAquiJovController, editando: _editando),
            Campo(label: 'Milheiros', valor: formulario.milheirosAquiJov, controller: _milheirosAquiJovController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Aquisição de Ração', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Estado de Origem do Fornecedor', valor: formulario.origemRacao, controller: _origemRacaoController, editando: _editando),
            Campo(label: 'Unidades', valor: formulario.unidadesRacao?.toString(), controller: _unidadesRacaoController, editando: _editando),
            Campo(label: 'Quantidade', valor: formulario.quantidadeRacao?.toString(), controller: _quantidadeRacaoController, editando: _editando),

            const SizedBox(height: 24),
            const Text('Comercialização por Espécie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Campo(label: 'Estado de Origem do fornecedor', valor: formulario.ufOrigemComercialEspecie, controller: _ufOrigemComercialEspecieController, editando: _editando),
            Campo(label: 'Espécie', valor: formulario.especieComercial, controller: _especieComercialController, editando: _editando),
            Campo(label: 'Produção', valor: formulario.prodComercial?.toString(), controller: _prodComercialController, editando: _editando),
            Campo(label: 'Quantidade', valor: formulario.quantidadeComercial?.toString(), controller: _quantidadeComercialController, editando: _editando),
            Campo(label: 'Preço Médio', valor: formulario.precoMedio?.toString(), controller: _precoMedioController, editando: _editando),

            // Testa se o usuário pressionou o botão de editar, se pressionado ele cria
            // os botões 'Cancelar' e 'Salvar' no final da página
            if (_editando)
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child:
                // Botão "Cancelar"
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _editando = false;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF0D47A1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Cancelar', style: TextStyle(color: Color(0xFF0D47A1)),
                        ),
                      ),
                    ),

                    // Botão "Salvar"
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _salvarAlteracoes,
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
              ),
          ],
        ),
      ),
    );
  }
}
