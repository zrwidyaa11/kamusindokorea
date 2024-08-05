import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {
  static final _databaseName = "tes.db";
  static final _databaseVersion = 1;

  static final table = 'DatabaseCoba';

  static final columnId = '_id';
  static final columnWord = 'word';
  static final columnTranslation = 'translation';
  static final columnTransliteration = 'transliteration';
  static const String columnKorean = 'korean'; // Added columnKorean getter

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    try {
      _database = await _initDatabase();
    } catch (e) {
      print("Error initializing database: $e");
    }
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    print("Database path: $path");

    // Periksa apakah file database ada sebelum menyalin
    final file = File(path);
    if (!await file.exists()) {
      print("Database file does not exist. Copying from assets...");
      ByteData data =
          await rootBundle.load(join('assets', 'databases', _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes, flush: true);
    } else {
      print("Database file already exists.");
    }

    // Pastikan database dibuka dengan benar
    return await openDatabase(path, version: _databaseVersion);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<int> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'))!;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<String?> translate(String word) async {
    try {
      Database? db = await instance.database;
      print("Database opened: $db");
      List<Map<String, dynamic>> result = await db!.query(
        table,
        columns: [columnTranslation],
        where: '$columnWord = ?',
        whereArgs: [word],
      );
      print("Query result: $result");

      if (result.isNotEmpty) {
        return result.first[columnTranslation] as String?;
      }
    } catch (e) {
      print("Error translating word: $e");
    }
    return null;
  }

  Future<String?> translateKoreanToIndonesian(String word) async {
    try {
      Database? db = await instance.database;
      print("Database opened: $db");
      List<Map<String, dynamic>> result = await db!.query(
        table,
        columns: [columnTranslation],
        where: '$columnKorean = ?', // Use columnKorean
        whereArgs: [word],
      );
      print("Query result: $result");

      if (result.isNotEmpty) {
        return result.first[columnTranslation] as String?;
      }
    } catch (e) {
      print("Error translating Korean to Indonesian: $e");
    }
    return null;
  }
}