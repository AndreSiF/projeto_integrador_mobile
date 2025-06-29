import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Essa classe é receita de bolo, cria o banco de dados e inicia as tabelas
class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  static Database? _database;

  factory AppDatabase() => _instance;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'aquicultor_database');
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE formulario (
            id_formulario INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_formulario TEXT,
            pessoa TEXT,
            has_responsavel_tecnico INTEGER,
            nome_responsavel_tecnico TEXT,
            registro_responsavel_tecnico TEXT,
            telefone_responsavel_tecnico TEXT,
            email_responsavel_tecnico TEXT,
            endereco_empreendimento TEXT,
            municipio_empreendimento TEXT,
            uf_empreendimento TEXT,
            latitude REAL,
            longitude REAL,
            has_dap INTEGER,
            dap INTEGER,
            has_licenca_ambiental INTEGER,
            licenca_ambiental INTEGER,
            has_outorga INTEGER,
            outorga TEXT,
            has_ctf INTEGER,
            ctf INTEGER,
            has_car INTEGER,
            car TEXT,
            has_oesa INTEGER,
            oesa INTEGER,
            has_assistencia_tecnica INTEGER,
            atendimentos_ano INTEGER,
            has_viveiro INTEGER,
            tipo_viveiro TEXT,
            area_viveiro REAL,
            has_tanque_rede INTEGER,
            area_tanque_rede REAL,
            has_sistema_fechado INTEGER,
            tipo_sistema_fechado TEXT,
            area_sistema_fechado REAL,
            has_raceway INTEGER,
            area_raceway REAL,
            area_forma_jovem REAL 
          )
        ''');
        await db.execute('''
          CREATE TABLE pessoa (
            id_pessoa INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_pessoa TEXT,
            uuid_formulario_pessoa TEXT,
            nome_pessoa TEXT,
            cpf_pessoa TEXT,
            telefone_pessoa TEXT,
            email_pessoa TEXT,
            rgp_pessoa TEXT,
            endereco TEXT,
            uf TEXT,
            municipio TEXT,
            razao_social TEXT,
            cnpj TEXT,
            cnae TEXT,
            responsavel_legal TEXT,
            rgp_responsavel_legal TEXT,
            telefone_responsavel_legal TEXT,
            email_responsavel_legal TEXT,
            FOREIGN KEY (uuid_formulario_pessoa) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE producao_ornamental (
            id_producao_ornamental INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_producao_ornamental TEXT,
            uuid_formulario_producao_ornamental TEXT,
            especie_producao_ornamental TEXT,
            producao_kg_producao_ornamental REAL,
            unidades_producao_ornamental INTEGER,
            FOREIGN KEY (uuid_formulario_producao_ornamental) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE producao_ornamentais (
            id_producao_ornamentais INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_producao_ornamentais TEXT,
            uuid_formulario_producao_ornamentais TEXT,
            uf_origem_producao_ornamentais TEXT,
            unidades_producao_ornamentais INTEGER,
            quantidade_producao_ornamentais REAL,
            FOREIGN KEY (uuid_formulario_producao_ornamentais) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE producao (
            id_producao INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_producao TEXT,
            uuid_formulario_producao TEXT,
            especie_producao TEXT,
            producao_kg_producao REAL,
            unidades_producao INTEGER,
            FOREIGN KEY (uuid_formulario_producao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE forma_jovem (
            id_forma_jovem INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_forma_jovem TEXT,
            uuid_formulario_forma_jovem TEXT,
            especie_forma_jovem TEXT,
            milheiros_forma_jovem REAL,
            FOREIGN KEY (uuid_formulario_forma_jovem) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE comercializacao (
            id_comercializacao INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_comercializacao TEXT,
            uuid_formulario_comercializacao TEXT,
            uf_origem_comercializacao TEXT,
            especie_comercializacao TEXT,
            producao_kg_comercializacao REAL,
            quantidade_comercializacao INTEGER,
            preco_medio_comercializacao REAL,
            FOREIGN KEY (uuid_formulario_comercializacao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE aquisicao_racao (
            id_aquisicao_racao INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_aquisicao_racao TEXT,
            uuid_formulario_aquisicao_racao TEXT,
            uf_origem_aquisicao_racao TEXT,
            unidade_aquisicao_racao TEXT,
            quantidade_aquisicao_racao REAL,
            FOREIGN KEY (uuid_formulario_aquisicao_racao) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE aquisicao_jovem (
            id_aquisicao_jovem INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid_aquisicao_jovem TEXT,
            uuid_formulario_aquisicao_jovem TEXT,
            uf_origem_aquisicao_jovem TEXT,
            especie_aquisicao_jovem TEXT,
            milheiros_aquisicao_jovem REAL,
            FOREIGN KEY (uuid_formulario_aquisicao_jovem) REFERENCES formulario(uuid_formulario) ON DELETE CASCADE
          )
        ''');
      },
    );
  }
}


