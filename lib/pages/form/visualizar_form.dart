import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/models/pessoa_form.dart';
import 'package:projeto_integrador_mobile/pages/fields/campo_visualizacao.dart';



class VisualizarFormPage extends StatefulWidget {
  final PessoaComFormulario dados;

  const VisualizarFormPage({super.key, required this.dados});

  @override
  State<VisualizarFormPage> createState() => _VisualizarFormPageState();
}

class _VisualizarFormPageState extends State<VisualizarFormPage> {
  bool _editando = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.dados.pessoa;
    final f = widget.dados.formulario;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Detalhes'),
          actions: [
          IconButton(
          icon: Icon(_editando ? Icons.close : Icons.edit),
      onPressed: () {
        setState(() {
          _editando = !_editando;
        });
      },
    ),
    ],),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dados da Pessoa
            const Text('Dados do Indivíduo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Nome', valor: p.nome),
            CampoDetalhe(label: 'CPF', valor: p.cpf),
            CampoDetalhe(label: 'Telefone', valor: p.telefone?.toString()),
            CampoDetalhe(label: 'Email', valor: p.email),
            CampoDetalhe(label: 'RGP', valor: p.rgp?.toString()),
            CampoDetalhe(label: 'UF', valor: p.uf),
            CampoDetalhe(label: 'Município', valor: p.municipio),
            CampoDetalhe(label: 'Endereço', valor: p.endereco),
            CampoDetalhe(label: 'Razão Social', valor: p.razaoSocial),
            CampoDetalhe(label: 'CNPJ', valor: p.cnpj),
            CampoDetalhe(label: 'CNAE', valor: p.cnae),

            // Dados da Fazenda
            const SizedBox(height: 24),
            const Text('Empreendimento', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Endereço', valor: f.enderecoEmpre),
            CampoDetalhe(label: 'Município', valor: f.municipioEmpre),
            CampoDetalhe(label: 'UF', valor: f.ufEmpre),

            const SizedBox(height: 24),
            const Text('Coordenadas Geográficas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Latitude', valor: f.latitude?.toString()),
            CampoDetalhe(label: 'Longitude', valor: f.longitude?.toString()),

            const SizedBox(height: 24),
            const Text('Número do DAP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'N° DAP', valor: f.dap?.toString()),

            const SizedBox(height: 24),
            const Text('Possui Licença Ambiental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'N° do Cadastro', valor: f.cadAmbiental?.toString()),

            const SizedBox(height: 24),
            const Text('Número da Outorga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'N° da Outorga', valor: f.outorga?.toString()),

            const SizedBox(height: 24),
            const Text('Número do Cadastro Técnico Federal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'CTF', valor: f.ctf?.toString()),

            const SizedBox(height: 24),
            const Text('Número do Cadastro Ambiental Rural', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'CAR', valor: f.car?.toString()),

            const SizedBox(height: 24),
            const Text('Número do cadastro na OESA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'OESA', valor: f.oesa?.toString()),

            const SizedBox(height: 24),
            const Text('Antedimentos Técnicos por Ano', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Atendimentos no Ano', valor: f.atendimentosAno?.toString()),

            const SizedBox(height: 24),
            const Text('Viveiro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Tipo Viveiro', valor: f.tipoViveiro),
            CampoDetalhe(label: 'Área Viveiro', valor: f.areaViveiro?.toString()),

            const SizedBox(height: 24),
            const Text('Tanque rede', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Área Taque Rede', valor: f.areaTaqueRede?.toString()),

            const SizedBox(height: 24),
            const Text('Sistema Fechado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Tipo Sistema Fechado', valor: f.tipoSistemaFechado),
            CampoDetalhe(label: 'Área Sistema Fechado', valor: f.areaSistemaFechado?.toString()),

            const SizedBox(height: 24),
            const Text('Raceway', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Área Raceway', valor: f.areaRaceway?.toString()),

            const SizedBox(height: 24),
            const Text('Produção', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Espécie', valor: f.especieProducao),
            CampoDetalhe(label: 'Peso', valor: f.pesoProducao?.toString()),
            CampoDetalhe(label: 'Unidades', valor: f.unidadesProducao?.toString()),

            const SizedBox(height: 24),
            const Text('Forma Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Área (m³)', valor: f.areaJovemProducao?.toString()),
            CampoDetalhe(label: 'Espécie', valor: f.especieAreaJov),
            CampoDetalhe(label: 'Milheiros', valor: f.milheirosAreaJov),

            const SizedBox(height: 24),
            const Text('Ornamental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Espécie', valor: f.especieOrnamental),
            CampoDetalhe(label: 'Peso', valor: f.pesoOrnamental?.toString()),
            CampoDetalhe(label: 'Unidades', valor: f.unidadesOrnamental?.toString()),

            const SizedBox(height: 24),
            const Text('Aquisição de Formas Jovem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Estado de Origem do Fornecedor', valor: f.ufAquisicaoJov),
            CampoDetalhe(label: 'Espécie', valor: f.especieAquiJov),
            CampoDetalhe(label: 'Milheiros', valor: f.milheirosAquiJov),

            const SizedBox(height: 24),
            const Text('Aquisição de Ração', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Estado de Origem do Fornecedor', valor: f.origemRacao),
            CampoDetalhe(label: 'Unidades', valor: f.unidadesRacao?.toString()),
            CampoDetalhe(label: 'Quantidade', valor: f.quantidadeRacao?.toString()),

            const SizedBox(height: 24),
            const Text('Comercialização por Espécie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CampoDetalhe(label: 'Estado de Origem do fornecedor', valor: f.ufOrigemComercialEspecie),
            CampoDetalhe(label: 'Espécie', valor: f.especieComercial),
            CampoDetalhe(label: 'Produção', valor: f.prodComercial?.toString()),
            CampoDetalhe(label: 'Quantidade', valor: f.quantidadeComercial?.toString()),
            CampoDetalhe(label: 'Preço Médio', valor: f.precoMedio?.toString()),

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
                        onPressed: () {},
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
