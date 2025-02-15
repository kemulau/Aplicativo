import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/planet.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'planets.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE planets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            distanceFromSun REAL NOT NULL,
            size REAL NOT NULL,
            nickname TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertPlanet(Planet planet) async {
    final db = await database;
    await db.insert('planets', planet.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Planet>> getPlanets() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('planets');
    return List.generate(maps.length, (i) => Planet.fromMap(maps[i]));
  }

  Future<void> updatePlanet(Planet planet) async {
    final db = await database;
    await db.update('planets', planet.toMap(),
        where: 'id = ?', whereArgs: [planet.id]);
  }

  Future<void> deletePlanet(int id) async {
    final db = await database;
    await db.delete('planets', where: 'id = ?', whereArgs: [id]);
  }
}
