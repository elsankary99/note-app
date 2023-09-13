import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlFLiteDatabase {
  static Database? _database;

  Future<Database?> get getInstance async {
    if (_database != null) {
      return _database;
    } else {
      _database = await dbInstance();
      return _database;
    }
  }

  Future<Database> dbInstance() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note_app.db');

    // create the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''
CREATE TABLE NOTE (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT NOT NULL,
 subTitle TEXT NOT NULL,
 createdTime TEXT NOT NULL,
 noteType TEXT NOT NULL,
 noteColor INTEGER NOT NULL);
          ''');
    });
    log("=== Data Base Has Been Created ===");
    return database;
  }

//! CRUD Operation

//?(1) Create
  Future<int> createData(String sqlText) async {
    Database? database = await getInstance;
    int count = await database!.rawInsert(sqlText);
    return count;
  }

//?(2) Read
  Future<List<dynamic>> readData(String sqlText) async {
    Database? database = await getInstance;
    List<Map> list = await database!.rawQuery(sqlText);
    return list;
  }

//?(3) Update
  Future<int> updateData(String sqlText) async {
    Database? database = await getInstance;
    int count = await database!.rawUpdate(sqlText);
    return count;
  }

//?(4) Delete
  Future<int> deleteData(String sqlText) async {
    Database? database = await getInstance;
    int count = await database!.rawDelete(sqlText);
    return count;
  }
}
