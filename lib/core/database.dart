import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
          CREATE TABLE pes_fis(
            id_fis INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            cpf TEXT NOT NULL,
            telefone INTEGER NOT NULL,
            email TEXT NOT NULL,
            rgp INT NOT NULL,
            uf TEXT NOT NULL,
            municipio TEXT NOT NULL,
            endereco TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE pes_jur(
            id_jur INTEGER PRIMARY KEY AUTOINCREMENT,
            razao_social TEXT NOT NULL,
            cnpj TEXT NOT NULL,
            cnae TEXT NOT NULL,
            uf TEXT NOT NULL,
            municipio TEXT NOT NULL,
            endereco TEXT NOT NULL,
            nome_resp TEXT NOT NULL,
            cpf_rest TEXT NOT NULL,
            rgp TEXT NOT NULL,
            telefone INTEGER NOT NULL,
            email TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE form(
            id_form INTEGER PRIMARY KEY AUTOINCREMENT,
            id_pessoa INTEGER NOT NULL,
            endereco_empre TEXT NOT NULL,
            municipio_empre TEXT NOT NULL,
            UF TEXT NOT NULL,
            latitude REAL NOT NULL,
            longitude REAL NOT NULL,
            pronaf TEXT,
            licenca_amb TEXT,
            outorga TEXT,
            ctf TEXT,
            car TEXT,
            oesa TEXT,
            assistencia_tec TEXT,
            viveiro_rev BLOB,
            area_viveiro REAL,
            area_tanque_rede REAL,
            tipo_sistema_fechado TEXT,
            area_sistema_fechado REAL,
            area_raceway REAL,
            area_prod_jovem REAL
          )
        ''');
        await db.execute('''
          CREATE TABLE aquisicao_jovem(
            id_aquis_jov INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            origem TEXT NOT NULL,
            especie TEXT NOT NULL,
            milheiros INTEGER NOT NULL
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE forma_jovem(
            id_forma_jov INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            especie TEXT NOT NULL,
            milheiros INT NOT NULL,
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE producao(
            id_ INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            tipo_prod TEXT NOT NULL,
            especie_prod TEXT NOT NULL,
            kg_prod REAL NOT NULL,
            unidades INTEGER NOT NULL,
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE producao_especie_orn(
            id_prod_orn INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            uf_origem TEXT NOT NULL,
            unidade TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            alimento_vivo BLOB,
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE comercio_especie(
            id_com_esp INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            uf_origem TEXT NOT NULL,
            especie TEXT NOT NULL,
            prod_comercial_kg REAL NOT NULL,
            preco_medio REAL NOT NULL,
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE aquisicao_racao(
            id_aqui_rac INTEGER PRIMARY KEY AUTOINCREMENT,
            id_form INTEGER NOT NULL,
            uf_origem TEXT NOT NULL,
            unidade TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            FOREIGN KEY (id_form) REFERENCES form(id_form) ON DELETE CASCADE
          )
        ''');
      },
    );
  }
}


