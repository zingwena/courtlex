
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/models/case.dart';
import 'package:courtlex/models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_sqflite_database.db');
    return await openDatabase(path, onCreate: _onCreate, version: 2);
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, address TEXT,city TEXT,phone TEXT,email TEXT,remarks TEXT)',

    );
    await db.execute(
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES clients(id) ON DELETE SET NULL)',
    );

    await db.execute(
      'CREATE TABLE cases(id INTEGER PRIMARY KEY, status TEXT, caseName TEXT, caseNumber TEXT, caseDate TEXT, '
          'caseRemarks TEXT, caseType TEXT, caseCharges TEXT, caseFee TEXT, casePetitioner TEXT, caseResponder TEXT, caseDescription TEXT, opponentName TEXT, opponentLawyer TEXT, opponentContact TEXT, courtName TEXT,'
          'courtCity TEXT,clientLawyer TEXT, lawFirm TEXT, judgeName TEXT , clientId INTEGER, FOREIGN KEY (clientId) REFERENCES clients(id) ON DELETE SET NULL)',
    );

  }

  Future<void> insertClient(Clients clients) async {
    final db = await _databaseService.database;
    await db.insert(
      'clients',
      clients.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCase(Cases cases) async {
    final db = await _databaseService.database;
    await db.insert(
      'cases',
      cases.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDog(Dog dog) async {
    final db = await _databaseService.database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateClient(Clients clients) async {
    final db = await _databaseService.database;

    await db.update(
      'clients',
      clients.toMap(),
      where: 'id = ?',
      whereArgs: [clients.id],
    );
  }

  Future<void> updateCase(Cases cases) async {
    final db = await _databaseService.database;

    await db.update(
      'cases',
      cases.toMap(),
      where: 'id = ?',
      whereArgs: [cases.id],
    );
  }

  Future<List<Clients>> clients() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('clients');
    return List.generate(maps.length, (index) => Clients.fromMap(maps[index]));
  }

  Future<List<Cases>> cases() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('cases');
    return List.generate(maps.length, (index) => Cases.fromMap(maps[index]));
  }

  Future<Clients> client(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('clients', where: 'id = ?', whereArgs: [id]);
    return Clients.fromMap(maps[0]);
  }

  Future<Cases> single_case(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('cases', where: 'id = ?', whereArgs: [id]);
    return Cases.fromMap(maps[0]);
  }

  Future<List<Dog>> dogs() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (index) => Dog.fromMap(maps[index]));
  }
  

  Future<void> updateDog(Dog dog) async {
    final db = await _databaseService.database;
    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> deleteClient(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'clients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

Future<void> deleteCase(int id) async {
  final db = await _databaseService.database;
  await db.delete(
    'cases',
    where: 'id = ?',
    whereArgs: [id],
  );
}

  Future<void> deleteDog(int id) async {
    final db = await _databaseService.database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}