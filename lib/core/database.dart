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
<<<<<<< Updated upstream
          CREATE TABLE pessoa(
            id_fis INTEGER PRIMARY KEY AUTOINCREMENT,
=======
          CREATE TABLE pessoa (
            id_pessoa INTEGER PRIMARY KEY AUTOINCREMENT,
>>>>>>> Stashed changes
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
          CREATE TABLE form(
            id_form INTEGER PRIMARY KEY AUTOINCREMENT,
<<<<<<< Updated upstream
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
=======
            id_pessoa INTEGER,
            endereco_empre TEXT,
            municipio_empre TEXT,
            uf_empre TEXT,
            latitude REAL,
            longitude REAL,
            dap INTEGER,
            cad_ambiental INTEGER,
            outorga INTEGER,
            ctf INTEGER,
            car INTEGER,
            oesa INTEGER,
            atendimentos_ano INTEGER,
            tipo_viveiro TEXT,
>>>>>>> Stashed changes
            area_viveiro REAL,
            area_tanque_rede REAL,
            tipo_sistema_fechado TEXT,
            area_sistema_fechado REAL,
            area_raceway REAL,
            area_prod_jovem REAL,
            origem_aqui_jovem TEXT NOT NULL,
            especie_aqui_jovem TEXT NOT NULL,
            milheiros_aqui_jovem INTEGER NOT NULL,
            especie_forma_jovem TEXT NOT NULL,
            milheiros_forma_jovem INT NOT NULL,
            tipo_prod TEXT NOT NULL,
            especie_prod TEXT NOT NULL,
            kg_prod REAL NOT NULL,
            unidades INTEGER NOT NULL,
            uf_origem_prod_esp_orn TEXT NOT NULL,
            unidade_prod_esp_orn TEXT NOT NULL,
            quantidade_prod_esp_orn INTEGER NOT NULL,
            alimento_vivo_prod_esp_orn BLOB,
            uf_origem_com_esp TEXT NOT NULL,
            especie_com_esp TEXT NOT NULL,
            prod_comercial_kg_com_esp REAL NOT NULL,
            preco_medio_com_esp REAL NOT NULL,
            uf_origem_aqui_rac TEXT NOT NULL,
            unidade_aqui_rac TEXT NOT NULL,
            quantidade_aqui_rac INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}


