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
          CREATE TABLE pessoa (
            id_pessoa INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            cpf TEXT,
            telefone INTEGER,
            email TEXT,
            rgp INT,
            uf TEXT,
            municipio TEXT,
            endereco TEXT,
            razao_social TEXT,
            cnpj TEXT,
            cnae TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE form (
            id_form INTEGER PRIMARY KEY AUTOINCREMENT,
            id_pessoa INTEGER NOT NULL,
            endereco_empre TEXT,
            municipio_empre TEXT,
            uf_empre TEXT,
            latitude REAL,
            longitude REAL,
            dap TEXT,
            cad_ambiental TEXT,
            outorga TEXT,
            ctf TEXT,
            car TEXT,
            oesa TEXT,
            atendimentos_ano INTEGER,
            tipo_viveiro TEXT,
            area_viveiro REAL,
            area_taque_rede REAL,
            tipo_sistema_fechado TEXT,
            area_sistema_fechado REAL,
            area_raceway REAL,
            especie_producao TEXT,
            peso_producao REAL,
            unidades_producao INTEGER,
            area_jovem_producao REAL,
            especie_area_jov TEXT,
            milheiros_area_jov INTEGER,
            especie_ornamental TEXT,
            peso_ornamental REAL,
            unidades_ornamental INTEGER,
            uf_aquisicao_jov TEXT,
            especie_aqui_jov TEXT,
            milheiros_aqui_jov INTEGER,
            origem_racao TEXT,
            unidades_racao INTEGER,
            quantidade_racao REAL,
            uf_origem_comercial_especie TEXT,
            especie_comercial TEXT,
            prod_comercial REAL,
            quantidade_comercial INTEGER,
            preco_medio REAL,
            FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
          );
        ''');
      },
    );
  }
}


