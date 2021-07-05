import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/src/models/scanModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id    INTERGER PRIMARY KEY,
          type  TEXT,
          value TEXT
        )
      ''');
    });
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final db = await database;
    final res = await db!.rawInsert('''
      INSERT INTO Scans( id, type, value )
        VALUES( '$id', '$type', '$value' )
    ''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.insert('Scans', newScan.toJson());

    return res;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db!.query('Scans');

    return res.isNotEmpty
        ? res.map((record) => ScanModel.fromJson(record)).toList()
        : null;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getScanByType(String type) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'type = ?', whereArgs: [type]);

    return res.isNotEmpty ? res.map((record) => ScanModel.fromJson(record)).toList() : null;
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

    Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db!.delete('Scans');

    return res;
  }
}