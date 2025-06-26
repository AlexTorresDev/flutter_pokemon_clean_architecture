import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider _db = DBProvider._();

  static DBProvider get instance => _db;

  static Database? _database;

  Future<Database?> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'pokemon_database.db'),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE pokemon(
            id INTEGER PRIMARY KEY,
            name TEXT,
            sort_order INTEGER,
            weight INTEGER,
            height INTEGER,
            base_experience INTEGER,
            is_default INTEGER,
            location_area_encounters TEXT
          );
          ''');
        db.execute('''
          CREATE TABLE IF NOT EXISTS sprites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            pokemon_id INTEGER,
            type TEXT,
            key TEXT,
            value TEXT,
            FOREIGN KEY(pokemon_id) REFERENCES pokemon(id)
          );
          ''');
      },
      version: 2,
    );
  }
}
