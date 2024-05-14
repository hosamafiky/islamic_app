// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  SqfliteHelper._privateConstructor();

  static final SqfliteHelper _instance = SqfliteHelper._privateConstructor();

  factory SqfliteHelper.instanceFor({
    required String databaseName,
    required String tableName,
  }) {
    _instance._databaseName = databaseName;
    _instance._tableName = tableName;
    return _instance;
  }

  late final String _databaseName;
  late final String _tableName;

  Future<Database> openDatabaseFromAssets() async {
    // Get the path for the database in the app's storage
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "$_databaseName.db");

    // Check if the database exists
    final dbExists = await databaseExists(path);

    // Copy from assets if not found
    if (!dbExists) {
      // Get the database file as a ByteData
      final data = await rootBundle.load('assets/quran/db/$_databaseName.db');
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Create the directory if it doesn't exist
      await Directory(dirname(path)).create(recursive: true);

      // Write the database file to the device storage
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // Open the database
    return await openDatabase(path);
  }

  Future<void> closeDatabase(Database database) async {
    await database.close();
  }

  Future<void> deleteExistDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "$_databaseName.db");

    await deleteDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getItemsFromDatabase() async {
    final database = await openDatabaseFromAssets();
    return await database.query(_tableName);
  }
}
