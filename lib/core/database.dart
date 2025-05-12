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
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');
        
        await db.execute('''
          CREATE TABLE pes_fis(
            id_fis INTEGER PRIMARY KEY AUTOINCREMENT,
            nome text NOT NULL,
            cpf text NOT NULL,
            telefone integer NOT NULL,
            email text NOT NULL,
            rgp int NOT NULL,
            uf text NOT NULL,
            municipio text NOT NULL,
            endereco text NOT NULL,
          )
        ''');
        await db.execute('''
          CREATE TABLE pes_jur(
            id_jur INTEGER PRIMARY KEY AUTOINCREMENT,
            razao_social text NOT NULL,
            cnpj text NOT NULL,
            cnae text NOT NULL,
            uf text NOT NULL,
            municipio text NOT NULL,
            endereco text NOT NULL,
            nome_resp text NOT NULL,
            cpf_rest text NOT NULL,
            rgp text NOT NULL,
            telefone integer NOT NULL,
            email text NOT NULL,
          )
        ''');
        await db.execute('''
          CREATE TABLE form(
            id_form INTEGER PRIMARY KEY AUTOINCREMENT,
            id_pessoa INTEGER NOT NULL,
            endereco_empre text NOT NULL,
            municipio_empre text NOT NULL,
            UF text NOT NULL,
            latitude double NOT NULL,
            longitude double NOT NULL,
            pronaf text,
            licenca_amb text,
            outorga text,
            ctf text,
            car text,
            oesa text,
            assistencia_tec text,
            viveiro_rev boolean,
            area_viveiro double,
            area_tanque_rede double,
            tipo_sistema_fechado text,
            area_sistema_fechado double,
            area_raceway double,
            area_prod_jovem double,
          )
        ''');
      },
    );
  }
}


