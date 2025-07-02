import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_comercializacao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamentais.dart';
import 'package:projeto_integrador_mobile/models/campos/campos_producao_ornamental.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/aquisicao_racao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/comercializacao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/forma_jovem.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/pessoa.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamentais.dart';
import 'package:projeto_integrador_mobile/models/form/elementos_formulario/producao_ornamental.dart';
import 'package:projeto_integrador_mobile/models/form/formulario.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/campo_visualizacao_component.dart';
import 'package:projeto_integrador_mobile/pages/components/fields/switch_form_component.dart';
import 'package:projeto_integrador_mobile/service/formulario_service.dart';

// Página que serve para visualizar um formulário específico
class VisualizarFormularioPage extends StatefulWidget {
  final Formulario dados;

  const VisualizarFormularioPage({super.key, required this.dados});

  @override
  State<VisualizarFormularioPage> createState() => _VisualizarFormularioPageState();
}

class _VisualizarFormularioPageState extends State<VisualizarFormularioPage> {
  bool _editando = false;
  late Pessoa pessoa;
  late Formulario formulario;
  late List<AquisicaoJovem>? aquisicoesJovens;
  late List<AquisicaoRacao>? aquisicoesRacao;
  late List<Comercializacao>? comercializacoes;
  late List<FormaJovem>? formasJovem;
  late List<Producao>? producoes;
  late List<ProducaoOrnamental>? producoesOrnamental;
  late List<ProducaoOrnamentais>? producoesOrnamentais;

  // Pessoa
  late TextEditingController _nomeController;
  late TextEditingController _cpfController;
  late TextEditingController _telefoneController;
  late TextEditingController _rgpController;
  late TextEditingController _emailController;
  late TextEditingController _ufController;
  late TextEditingController _municipioController;
  late TextEditingController _enderecoController;
  late TextEditingController _razaoSocialController;
  late TextEditingController _cnpjController;
  late TextEditingController _cnaeController;
  late TextEditingController _respController;
  late TextEditingController _cpfRespController;
  late TextEditingController _telefoneRespController;
  late TextEditingController _rgpRespController;
  late TextEditingController _emailRespController;

  // Formulario
  // Identificação empreendimento
  late TextEditingController _nomeRespTecnicoController;
  late TextEditingController _numRespTecnicoController;
  late TextEditingController _telefoneRespTecnicoController;
  late TextEditingController _emailRespTecnicoController;
  late TextEditingController _enderecoEmpreController;
  late TextEditingController _municipioEmpreController;
  late TextEditingController _ufEmpreController;
  late TextEditingController _latitudeController;
  late TextEditingController _longitudeController;
  late TextEditingController _dapController;
  late TextEditingController _cadAmbientalController;
  late TextEditingController _numOutorgaController;
  late TextEditingController _ctfController;
  late TextEditingController _carController;
  late TextEditingController _oesaController;
  late TextEditingController _atendimentosAnoController;
  late bool _hasRespTecnico;
  late bool _hasDAP;
  late bool _hasLicencaAmb;
  late bool _hasOutorga;
  late bool _hasCTF;
  late bool _hasCAR;
  late bool _hasOESA;
  late bool _hasAssistenciaTecnica;

  // Cultivo e produção
  late TextEditingController _tipoViveiroController;
  late TextEditingController _areaViveiroController;
  late TextEditingController _areaTanqueRedeController;
  late TextEditingController _tipoSistemaFechadoController;
  late TextEditingController _areaSistemaFechadoController;
  late TextEditingController _areaRacewayController;
  late TextEditingController _areaJovemProducaoController;
  late List<CamposProducao> producoesController = [];
  late List<CamposFormaJovem> formasJovensController = [];
  late List<CamposProducaoOrnamental> producoesOrnamentalController = [];
  late bool _hasViveiro;
  late bool _hasTanqueRede;
  late bool _hasSistemaFechado;
  late bool _hasRaceway;

  // Informações comerciais
  late List<CamposAquisicaoJov> aquisicoesJovemController = [];
  late List<CamposAquisicaoRacao> aquisicoesRacaoController = [];
  late List<CamposComercializacao> comercializacoesEspecieController = [];
  late List<CamposProducaoOrnamentais> producoesOrnamentaisController = [];


  @override
  void initState() {
    super.initState();
    formulario = widget.dados;
    pessoa = widget.dados.pessoa!;
    aquisicoesJovens = widget.dados.aquisicoesFormaJovem;
    aquisicoesRacao = widget.dados.aquisicoesRacao;
    comercializacoes = widget.dados.comercializacaoEspecie;
    formasJovem = widget.dados.formasJovem;
    producoes = widget.dados.producoes;
    producoesOrnamentais = widget.dados.producoesOrnamentais;
    producoesOrnamental = widget.dados.producoesOrnamental;

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
    _respController = TextEditingController(text: pessoa.responsavelLegal ?? '');
    _cpfRespController = TextEditingController(text: pessoa.cpfResponsavelLegal ?? '');
    _telefoneRespController = TextEditingController(text: pessoa.telefoneResponsavelLegal ?? '');
    _rgpRespController = TextEditingController(text: pessoa.rgpResponsavelLegal ?? '');
    _emailRespController = TextEditingController(text: pessoa.emailResponsavelLegal ?? '');

    // Formulario
    _nomeRespTecnicoController = TextEditingController(text: formulario.nomeResponsavelTecnico);
    _numRespTecnicoController = TextEditingController(text: formulario.registroResponsavelTecnico);
    _telefoneRespTecnicoController = TextEditingController(text: formulario.telefoneResponsavelTecnico);
    _emailRespTecnicoController = TextEditingController(text: formulario.emailResponsavelTecnico);
    _enderecoEmpreController = TextEditingController(text: formulario.enderecoEmpreendimento ?? '');
    _municipioEmpreController = TextEditingController(text: formulario.municipioEmpreendimento ?? '');
    _ufEmpreController = TextEditingController(text: formulario.ufEmpreendimento ?? '');
    _latitudeController = TextEditingController(text: formulario.latitude ?? '');
    _longitudeController = TextEditingController(text: formulario.longitude ?? '');
    _dapController = TextEditingController(text: formulario.dap?.toString() ?? '');
    _cadAmbientalController = TextEditingController(text: formulario.licencaAmbiental?.toString() ?? '');
    _numOutorgaController = TextEditingController(text: formulario.outorga?.toString() ?? '');
    _ctfController = TextEditingController(text: formulario.ctf?.toString() ?? '');
    _carController = TextEditingController(text: formulario.car ?? '');
    _oesaController = TextEditingController(text: formulario.oesa?.toString() ?? '');
    _atendimentosAnoController = TextEditingController(text: formulario.atendimentosAno?.toString() ?? '');
    _hasRespTecnico = formulario.hasResponsavelTecnico!;
    _hasDAP = formulario.hasDap!;
    _hasLicencaAmb = formulario.hasLicencaAmbiental!;
    _hasOutorga = formulario.hasOutorga!;
    _hasCTF = formulario.hasCtf!;
    _hasCAR = formulario.hasCar!;
    _hasOESA = formulario.hasOesa!;
    _hasAssistenciaTecnica = formulario.hasAssistenciaTecnica!;

    _tipoViveiroController = TextEditingController(text: formulario.tipoViveiro ?? '');
    _areaViveiroController = TextEditingController(text: formulario.areaViveiro?.toString() ?? '');
    _areaTanqueRedeController = TextEditingController(text: formulario.areaTanqueRede?.toString() ?? '');
    _tipoSistemaFechadoController = TextEditingController(text: formulario.tipoSistemaFechado ?? '');
    _areaSistemaFechadoController = TextEditingController(text: formulario.areaSistemaFechado?.toString() ?? '');
    _areaRacewayController = TextEditingController(text: formulario.areaRaceway?.toString() ?? '');
    _areaJovemProducaoController = TextEditingController(text: formulario.areaFormaJovem?.toString() ?? '');
    producoesController = CamposProducao().obterCamposProducao(producoes) ?? [];
    formasJovensController = CamposFormaJovem().obterCamposFormaJovem(formasJovem) ?? [];
    producoesOrnamentalController = CamposProducaoOrnamental().obterCamposProducao(producoesOrnamental) ?? [];
    _hasViveiro = formulario.hasViveiro!;
    _hasTanqueRede = formulario.hasTanqueRede!;
    _hasSistemaFechado = formulario.hasSistemaFechado!;
    _hasRaceway = formulario.hasRaceway!;

    aquisicoesJovemController = CamposAquisicaoJov().obterCamposAquisicaoJovem(aquisicoesJovens) ?? [];
    aquisicoesRacaoController = CamposAquisicaoRacao().obterCamposAquisicaoRacao(aquisicoesRacao) ?? [];
    comercializacoesEspecieController = CamposComercializacao().obterCamposComercializacao(comercializacoes) ?? [];
    producoesOrnamentaisController = CamposProducaoOrnamentais().obterCamposProducaoOrnamentais(producoesOrnamentais) ?? [];
  }

  // Restaura os valores originais dos campos quando o botão de cancelar edição é pressionado
  void _restaurarCampos() {
    final pessoa = widget.dados.pessoa;
    final formulario = widget.dados;
    final aquisicoesJovens = widget.dados.aquisicoesFormaJovem;
    final aquisicoesRacao = widget.dados.aquisicoesRacao;
    final comercializacoes = widget.dados.comercializacaoEspecie;
    final formasJovem = widget.dados.formasJovem;
    final producoes = widget.dados.producoes;
    final producoesOrnamentais = widget.dados.producoesOrnamentais;
    final producoesOrnamental = widget.dados.producoesOrnamental;

    // Pessoa
    _nomeController.text = pessoa?.nome ?? '';
    _cpfController.text = pessoa?.cpf ?? '';
    _telefoneController.text = pessoa?.telefone ?? '';
    _emailController.text = pessoa?.email ?? '';
    _rgpController.text = pessoa?.rgp ?? '';
    _ufController.text = pessoa?.uf ?? '';
    _municipioController.text = pessoa?.municipio ?? '';
    _enderecoController.text = pessoa?.endereco ?? '';
    _razaoSocialController.text = pessoa?.razaoSocial ?? '';
    _cnpjController.text = pessoa?.cnpj ?? '';
    _cnaeController.text = pessoa?.cnae ?? '';
    _respController.text = pessoa?.responsavelLegal ?? '';
    _cpfRespController.text = pessoa?.cpfResponsavelLegal ?? '';
    _telefoneRespController.text = pessoa?.telefoneResponsavelLegal ?? '';
    _rgpRespController.text = pessoa?.rgpResponsavelLegal ?? '';
    _emailRespController.text = pessoa?.emailResponsavelLegal ?? '';

    // Formulário
    _nomeRespTecnicoController = TextEditingController(text: formulario.nomeResponsavelTecnico);
    _numRespTecnicoController = TextEditingController(text: formulario.registroResponsavelTecnico);
    _telefoneRespTecnicoController = TextEditingController(text: formulario.telefoneResponsavelTecnico);
    _emailRespTecnicoController = TextEditingController(text: formulario.emailResponsavelTecnico);
    _enderecoEmpreController = TextEditingController(text: formulario.enderecoEmpreendimento ?? '');
    _municipioEmpreController = TextEditingController(text: formulario.municipioEmpreendimento ?? '');
    _ufEmpreController = TextEditingController(text: formulario.ufEmpreendimento ?? '');
    _latitudeController = TextEditingController(text: formulario.latitude ?? '');
    _longitudeController = TextEditingController(text: formulario.longitude ?? '');
    _dapController = TextEditingController(text: formulario.dap?.toString() ?? '');
    _cadAmbientalController = TextEditingController(text: formulario.licencaAmbiental?.toString() ?? '');
    _numOutorgaController = TextEditingController(text: formulario.outorga?.toString() ?? '');
    _ctfController = TextEditingController(text: formulario.ctf?.toString() ?? '');
    _carController = TextEditingController(text: formulario.car ?? '');
    _oesaController = TextEditingController(text: formulario.oesa?.toString() ?? '');
    _atendimentosAnoController = TextEditingController(text: formulario.atendimentosAno?.toString() ?? '');
    _hasRespTecnico = formulario.hasResponsavelTecnico!;
    _hasDAP = formulario.hasDap!;
    _hasLicencaAmb = formulario.hasLicencaAmbiental!;
    _hasOutorga = formulario.hasOutorga!;
    _hasCTF = formulario.hasCtf!;
    _hasCAR = formulario.hasCar!;
    _hasOESA = formulario.hasOesa!;
    _hasAssistenciaTecnica = formulario.hasAssistenciaTecnica!;

    _tipoViveiroController = TextEditingController(text: formulario.tipoViveiro ?? '');
    _areaViveiroController = TextEditingController(text: formulario.areaViveiro?.toString() ?? '');
    _areaTanqueRedeController = TextEditingController(text: formulario.areaTanqueRede?.toString() ?? '');
    _tipoSistemaFechadoController = TextEditingController(text: formulario.tipoSistemaFechado ?? '');
    _areaSistemaFechadoController = TextEditingController(text: formulario.areaSistemaFechado?.toString() ?? '');
    _areaRacewayController = TextEditingController(text: formulario.areaRaceway?.toString() ?? '');
    _areaJovemProducaoController = TextEditingController(text: formulario.areaFormaJovem?.toString() ?? '');
    producoesController = CamposProducao().obterCamposProducao(producoes) ?? [];
    formasJovensController = CamposFormaJovem().obterCamposFormaJovem(formasJovem) ?? [];
    producoesOrnamentalController = CamposProducaoOrnamental().obterCamposProducao(producoesOrnamental) ?? [];
    _hasViveiro = formulario.hasViveiro!;
    _hasTanqueRede = formulario.hasTanqueRede!;
    _hasSistemaFechado = formulario.hasSistemaFechado!;
    _hasRaceway = formulario.hasRaceway!;

    aquisicoesJovemController = CamposAquisicaoJov().obterCamposAquisicaoJovem(aquisicoesJovens) ?? [];
    aquisicoesRacaoController = CamposAquisicaoRacao().obterCamposAquisicaoRacao(aquisicoesRacao) ?? [];
    comercializacoesEspecieController = CamposComercializacao().obterCamposComercializacao(comercializacoes) ?? [];
    producoesOrnamentaisController = CamposProducaoOrnamentais().obterCamposProducaoOrnamentais(producoesOrnamentais) ?? [];
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
    final formularioService = FormularioService();

    try {
      await formularioService.deleteFormulario(widget.dados.uuid!);

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
      uuid: pessoa.uuid,
      uuidFormulario: formulario.uuid,
      nome: _nomeController.text,
      cpf: _cpfController.text,
      telefone: _telefoneController.text,
      email: _emailController.text,
      rgp: _rgpController.text,
      uf: _ufController.text,
      municipio: _municipioController.text,
      endereco: _enderecoController.text,
      razaoSocial: _razaoSocialController.text,
      cnpj: _cnpjController.text,
      cnae: _cnaeController.text,
      responsavelLegal: _respController.text,
      cpfResponsavelLegal: _cpfRespController.text,
      telefoneResponsavelLegal: _telefoneRespController.text,
      rgpResponsavelLegal: _rgpRespController.text,
      emailResponsavelLegal: _emailRespController.text,
    );

    final formularioAtualizado = Formulario(
      uuid: formulario.uuid,
      enviado: formulario.enviado,
      pessoa: pessoaAtualizada,
      hasResponsavelTecnico: _hasRespTecnico,
      nomeResponsavelTecnico: _nomeRespTecnicoController.text,
      registroResponsavelTecnico: _numRespTecnicoController.text,
      telefoneResponsavelTecnico: _telefoneRespTecnicoController.text,
      emailResponsavelTecnico: _emailRespTecnicoController.text,
      enderecoEmpreendimento: _enderecoEmpreController.text,
      municipioEmpreendimento: _municipioEmpreController.text,
      ufEmpreendimento: _ufEmpreController.text,
      latitude: _latitudeController.text,
      longitude: _longitudeController.text,
      hasDap: _hasDAP,
      dap: int.tryParse(_dapController.text),
      hasLicencaAmbiental: _hasLicencaAmb,
      licencaAmbiental: int.tryParse(_cadAmbientalController.text),
      hasOutorga: _hasOutorga,
      outorga: _numOutorgaController.text,
      hasCtf: _hasCTF,
      ctf: int.tryParse(_ctfController.text),
      hasCar: _hasCAR,
      car: _carController.text,
      hasOesa: _hasOESA,
      oesa: int.tryParse(_oesaController.text),
      hasAssistenciaTecnica: _hasAssistenciaTecnica,
      atendimentosAno: int.tryParse(_atendimentosAnoController.text),
      hasViveiro: _hasViveiro,
      tipoViveiro: _tipoViveiroController.text,
      areaViveiro: double.tryParse(_areaViveiroController.text),
      hasTanqueRede: _hasTanqueRede,
      areaTanqueRede: double.tryParse(_areaTanqueRedeController.text),
      hasSistemaFechado: _hasSistemaFechado,
      tipoSistemaFechado: _tipoSistemaFechadoController.text,
      areaSistemaFechado: double.tryParse(_areaSistemaFechadoController.text),
      hasRaceway: _hasRaceway,
      areaRaceway: double.tryParse(_areaRacewayController.text),
      producoes: Producao().obterProducoes(producoesController),
      areaFormaJovem: double.tryParse(_areaJovemProducaoController.text),
      formasJovem: FormaJovem().obterFormas(formasJovensController),
      producoesOrnamental: ProducaoOrnamental().obterProducoes(producoesOrnamentalController),
      aquisicoesFormaJovem: AquisicaoJovem().obterAquisicoesJovem(aquisicoesJovemController),
      aquisicoesRacao: AquisicaoRacao().obterRacoes(aquisicoesRacaoController),
      comercializacaoEspecie: Comercializacao().obterComercializacoes(comercializacoesEspecieController),
      producoesOrnamentais: ProducaoOrnamentais().obterProducoes(producoesOrnamentaisController),
    );

    final FormularioService formularioService = FormularioService();
    formularioService.updateFormulario(formularioAtualizado);

    setState(() {
      _editando = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dados atualizados com sucesso')),
    );
  }

  void _formularioJaEnviado() async {
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Formulário já enviado'),
        content: const Text('Este formulário já foi enviado ao servidor e não pode mais ser editado.'),
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
        appBar: AppBar(
          title: const Text('Detalhes do Formulário'),
          actions: [
            IconButton(
              icon: Icon(_editando ? Icons.close : Icons.edit),
              onPressed: () {
                if(!widget.dados.enviado!){
                  if(_editando){
                    _restaurarCampos();
                    setState(() {
                      _editando = !_editando;
                    });
                  }
                  else{
                    setState(() {
                      _editando = !_editando;
                    });
                  }
                }
                else{
                  _formularioJaEnviado();
                }
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
            children: <Widget>[
              // Dados da Pessoa
              const Text('Dados do Indivíduo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Campo(label: 'Nome', valor: pessoa.nome, controller: _nomeController, editando: _editando, isEnabled: true),
              Campo(label: 'CPF', valor: pessoa.cpf, controller: _cpfController, editando: _editando, isEnabled: true),
              Campo(label: 'Telefone', valor: pessoa.telefone, controller: _telefoneController, editando: _editando, isEnabled: true),
              Campo(label: 'Email', valor: pessoa.email, controller: _emailController, editando: _editando, isEnabled: true),
              Campo(label: 'RGP', valor: pessoa.rgp, controller: _rgpController, editando: _editando, isEnabled: true),
              Campo(label: 'UF', valor: pessoa.uf, controller: _ufController, editando: _editando, isEnabled: true),
              Campo(label: 'Município', valor: pessoa.municipio, controller: _municipioController, editando: _editando, isEnabled: true),
              Campo(label: 'Endereço', valor: pessoa.endereco, controller: _enderecoController, editando: _editando, isEnabled: true),
              Campo(label: 'Razão Social', valor: pessoa.razaoSocial, controller: _razaoSocialController, editando: _editando, isEnabled: true),
              Campo(label: 'CNPJ', valor: pessoa.cnpj, controller: _cnpjController, editando: _editando, isEnabled: true),
              Campo(label: 'CNAE', valor: pessoa.cnae, controller: _cnaeController, editando: _editando, isEnabled: true),
              Campo(label: 'Responsável Técnico', valor: pessoa.responsavelLegal, controller: _respController, editando: _editando, isEnabled: true),
              Campo(label: 'CPF do Responsável Técnico', valor: pessoa.cpfResponsavelLegal, controller: _cpfRespController, editando: _editando, isEnabled: true),
              Campo(label: 'Telefone do Responsável Técnico', valor: pessoa.telefoneResponsavelLegal, controller: _telefoneRespController, editando: _editando, isEnabled: true),
              Campo(label: 'RGP do Responsável Técnico', valor: pessoa.rgpResponsavelLegal, controller: _rgpRespController, editando: _editando, isEnabled: true),
              Campo(label: 'E-mail do Responsável Técnico', valor: pessoa.emailResponsavelLegal, controller: _emailRespController, editando: _editando, isEnabled: true),

              // Dados da Fazenda
              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Responsável Técnico',
                  value: _hasRespTecnico,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                    _hasRespTecnico = val;
                    _nomeRespTecnicoController.clear();
                    _numRespTecnicoController.clear();
                    _telefoneRespTecnicoController.clear();
                    _emailRespTecnicoController.clear();
                    });
                  },
              ),
              Campo(label: 'Nome do Responsável Técnico', valor: formulario.nomeResponsavelTecnico, controller: _nomeRespTecnicoController, editando: _editando, isEnabled: _hasRespTecnico),
              Campo(label: 'Registro do Responsável Técnico', valor: formulario.registroResponsavelTecnico, controller: _numRespTecnicoController, editando: _editando, isEnabled: _hasRespTecnico),
              Campo(label: 'Telefone do Responsável Técnico', valor: formulario.telefoneResponsavelTecnico, controller: _telefoneRespTecnicoController, editando: _editando, isEnabled: _hasRespTecnico),
              Campo(label: 'E-mail do Responsável Técnico', valor: formulario.emailResponsavelTecnico, controller: _emailRespTecnicoController, editando: _editando, isEnabled: _hasRespTecnico),

              const Text('Empreendimento', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Campo(label: 'Endereço', valor: formulario.enderecoEmpreendimento, controller: _enderecoEmpreController, editando: _editando, isEnabled: true),
              Campo(label: 'Município', valor: formulario.municipioEmpreendimento, controller: _municipioEmpreController, editando: _editando, isEnabled: true),
              Campo(label: 'UF', valor: formulario.ufEmpreendimento, controller: _ufEmpreController, editando: _editando, isEnabled: true),

              const SizedBox(height: 24),
              const Text('Coordenadas Geográficas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Campo(label: 'Latitude', valor: formulario.latitude, controller: _latitudeController, editando: _editando, isEnabled: true),
              Campo(label: 'Longitude', valor: formulario.longitude, controller: _longitudeController, editando: _editando, isEnabled: true),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Documento de\nAptidão ao PRONAF-DAP',
                  value: _hasDAP,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasDAP = val;
                      _dapController.clear();
                    });
                  }
              ),
              Campo(label: 'N° DAP', valor: formulario.dap?.toString(), controller: _dapController, editando: _editando, isEnabled: _hasDAP),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Licença Ambiental',
                  value: _hasLicencaAmb,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasLicencaAmb = val;
                      _cadAmbientalController.clear();
                    });
                  }
              ),
              Campo(label: 'N° do Cadastro', valor: formulario.licencaAmbiental?.toString(), controller: _cadAmbientalController, editando: _editando, isEnabled: _hasLicencaAmb),

              const SizedBox(height: 24),
              SwitchForm(
                  label: "Possui Outorga de uso d'água",
                  value: _hasOutorga,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasOutorga = val;
                      _numOutorgaController.clear();
                    });
                  }
              ),
              Campo(label: 'N° da Outorga', valor: formulario.outorga?.toString(), controller: _numOutorgaController, editando: _editando, isEnabled: _hasOutorga),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Cadastro Técnico\nFederal - CTF',
                  value: _hasCTF,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasCTF = val;
                      _ctfController.clear();
                    });
                  }
              ),
              Campo(label: 'CTF', valor: formulario.ctf?.toString(), controller: _ctfController, editando: _editando, isEnabled: _hasCTF),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Cadastro Ambiental\nRural - CAR',
                  value: _hasCAR,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasCAR = val;
                      _carController.clear();
                    });
                  }
              ),
              Campo(label: 'CAR', valor: formulario.car?.toString(), controller: _carController, editando: _editando, isEnabled: _hasCAR),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Cadastro na OESA',
                  value: _hasOESA,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasOESA = val;
                      _oesaController.clear();
                    });
                  }
              ),
              Campo(label: 'OESA', valor: formulario.oesa?.toString(), controller: _oesaController, editando: _editando, isEnabled: _hasOESA),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Possui Assistência Técnica',
                  value: _hasAssistenciaTecnica,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasAssistenciaTecnica = val;
                      _atendimentosAnoController.clear();
                    });
                  }
              ),
              Campo(label: 'Atendimentos no Ano', valor: formulario.atendimentosAno?.toString(), controller: _atendimentosAnoController, editando: _editando, isEnabled: _hasAssistenciaTecnica),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Viveiro',
                  value: _hasViveiro,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasViveiro = val;
                      _tipoViveiroController.clear();
                      _areaViveiroController.clear();
                    });
                  }
              ),
              Campo(label: 'Tipo Viveiro', valor: formulario.tipoViveiro, controller: _tipoViveiroController, editando: _editando, isEnabled: _hasViveiro),
              Campo(label: 'Área Viveiro', valor: formulario.areaViveiro?.toString(), controller: _areaViveiroController, editando: _editando, isEnabled: _hasViveiro),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Tanque Rede',
                  value: _hasTanqueRede,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasTanqueRede = val;
                      _areaTanqueRedeController.clear();
                    });
                  }
              ),
              Campo(label: 'Área Taque Rede', valor: formulario.areaTanqueRede?.toString(), controller: _areaTanqueRedeController, editando: _editando, isEnabled: _hasTanqueRede),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Sistema Fechado',
                  value: _hasSistemaFechado,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasSistemaFechado = val;
                      _tipoSistemaFechadoController.clear();
                      _areaSistemaFechadoController.clear();
                    });
                  }
              ),
              Campo(label: 'Tipo Sistema Fechado', valor: formulario.tipoSistemaFechado, controller: _tipoSistemaFechadoController, editando: _editando, isEnabled: _hasSistemaFechado),
              Campo(label: 'Área Sistema Fechado', valor: formulario.areaSistemaFechado?.toString(), controller: _areaSistemaFechadoController, editando: _editando, isEnabled: _hasSistemaFechado),

              const SizedBox(height: 24),
              SwitchForm(
                  label: 'Raceway',
                  value: _hasRaceway,
                  editando: _editando,
                  onChanged: (val) {
                    setState(() {
                      _hasRaceway = val;
                      _areaRacewayController.clear();
                    });
                  }
              ),
              Campo(label: 'Área Raceway', valor: formulario.areaRaceway?.toString(), controller: _areaRacewayController, editando: _editando, isEnabled: _hasRaceway),

              const SizedBox(height: 24),
              const Text('Produção', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: producoesController.length,
                itemBuilder: (context, index) {
                  final producao = producoesController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Espécie Digitada]", valor: producao.especieController.text, controller: producao.especieController, editando: _editando, isEnabled: true),
                          Campo(label: "[Produção (kg) Digitada]", valor: producao.producaoKgController.text, controller: producao.producaoKgController, editando: _editando, isEnabled: true),
                          Campo(label: "[Unidades (se anfíbio ou réptil)]", valor: producao.unidadesController.text, controller: producao.unidadesController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
              const Text('Forma Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Campo(label: 'Área Forma Jovem', valor: _areaJovemProducaoController.text, controller: _areaJovemProducaoController, editando: _editando, isEnabled: true),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: formasJovensController.length,
                itemBuilder: (context, index) {
                  final formaJovem = formasJovensController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Espécie Digitada]", valor: formaJovem.especieController.text, controller: formaJovem.especieController, editando: _editando, isEnabled: true),
                          Campo(label: "[Milheiros Digitado]", valor: formaJovem.milheirosController.text, controller: formaJovem.milheirosController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
              const Text('Produção Ornamental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: producoesOrnamentalController.length,
                itemBuilder: (context, index) {
                  final producaoOrnamental = producoesOrnamentalController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Espécie Digitada]", valor: producaoOrnamental.especieController.text, controller: producaoOrnamental.especieController, editando: _editando, isEnabled: true),
                          Campo(label: "[Produção (kg) Digitada]", valor: producaoOrnamental.producaoKgController.text, controller: producaoOrnamental.producaoKgController, editando: _editando, isEnabled: true),
                          Campo(label: "[Unidades Digitada]", valor: producaoOrnamental.unidadesController.text, controller: producaoOrnamental.unidadesController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('Aquisição de Formas Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: aquisicoesJovemController.length,
                itemBuilder: (context, index) {
                  final aquisicaoJovem = aquisicoesJovemController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Estado de Origem]", valor: aquisicaoJovem.ufOrigemController.text, controller: aquisicaoJovem.ufOrigemController, editando: _editando, isEnabled: true),
                          Campo(label: "[Espécie Digitada]", valor: aquisicaoJovem.especieController.text, controller: aquisicaoJovem.especieController, editando: _editando, isEnabled: true),
                          Campo(label: "[Milheiros Digitados]", valor: aquisicaoJovem.milheirosController.text, controller: aquisicaoJovem.milheirosController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('Aquisição de Ração', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: aquisicoesRacaoController.length,
                itemBuilder: (context, index) {
                  final aquisicaoRacao = aquisicoesRacaoController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Estado de Origem]", valor: aquisicaoRacao.ufOrigemController.text, controller: aquisicaoRacao.ufOrigemController, editando: _editando, isEnabled: true),
                          Campo(label: "[Unidade Digitada]", valor: aquisicaoRacao.unidadeController.text, controller: aquisicaoRacao.unidadeController, editando: _editando, isEnabled: true),
                          Campo(label: "[Quantidade Digitada]", valor: aquisicaoRacao.quantidadeController.text, controller: aquisicaoRacao.quantidadeController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('Comercialização por Espécie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comercializacoesEspecieController.length,
                itemBuilder: (context, index) {
                  final comercializacao = comercializacoesEspecieController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Estado de Origem]", valor: comercializacao.ufOrigemController.text, controller: comercializacao.ufOrigemController, editando: _editando, isEnabled: true),
                          Campo(label: "[Espécie Digitada]", valor: comercializacao.especieController.text, controller: comercializacao.especieController, editando: _editando, isEnabled: true),
                          Campo(label: "[Produção (kg) Digitada]", valor: comercializacao.producaoKgController.text, controller: comercializacao.producaoKgController, editando: _editando, isEnabled: true),
                          Campo(label: "[Quantidade Digitada]", valor: comercializacao.quantidadeController.text, controller: comercializacao.quantidadeController, editando: _editando, isEnabled: true),
                          Campo(label: "[Preço Médio]", valor: comercializacao.precoMedioController.text, controller: comercializacao.precoMedioController, editando: _editando, isEnabled: true),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
              const Text('Produção Ornamentais', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: producoesOrnamentaisController.length,
                itemBuilder: (context, index) {
                  final producaoOrnamentais = producoesOrnamentaisController[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Campo(label: "[Estado de Origem]", valor: producaoOrnamentais.ufOrigemController.text, controller: producaoOrnamentais.ufOrigemController, editando: _editando, isEnabled: true),
                          Campo(label: "[Unidade Digitada]", valor: producaoOrnamentais.unidadeController.text, controller: producaoOrnamentais.unidadeController, editando: _editando, isEnabled: true),
                          Campo(label: "[Quantidade Digitada]", valor: producaoOrnamentais.quantidadeController.text, controller: producaoOrnamentais.quantidadeController, editando: _editando, isEnabled: true),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),


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
                            _restaurarCampos();
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
                          child: Text('Cancelar', style: TextStyle(color: Color(
                              0xFF0D47A1)),
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
                          child: Text('Salvar', style: TextStyle(color: Colors
                              .white),),
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
