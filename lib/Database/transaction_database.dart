import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transaction_model.dart';

class TransactionDatabaseManager {
  static final TransactionDatabaseManager instance =
      TransactionDatabaseManager._init();
  static Database? _database;
  TransactionDatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('transaction.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = dbPath + filePath;
      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing database: $e');
      }
      rethrow;
    }
  }

  Future _createDB(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NOT NULL';
    // const String boolType = 'BOOLEAN NOT NULL';
    const String doubleType = 'DOUBLE NOT NULL';
    await db.execute(''' 
      CREATE TABLE $transactionTable (
        ${TransactionFields.id} $idType,
        ${TransactionFields.sender} $textType,
        ${TransactionFields.receiver} $textType,
        ${TransactionFields.amount} $doubleType,
        ${TransactionFields.date} $textType
      )
''');
  }

  Future<TransactionModel> createTransaction(
      TransactionModel transaction) async {
    final db = await instance.database;
    final id = await db.insert(transactionTable, transaction.toJson());
    return transaction.copyWith(id: id);
  }

  Future<TransactionModel> readTransaction(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      transactionTable,
      columns: TransactionFields.values,
      where: '${TransactionFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return TransactionModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TransactionModel>> readAllTransactions() async {
    final db = await instance.database;
    const orderBy = '${TransactionFields.id} DESC';
    final result = await db.query(transactionTable, orderBy: orderBy);
    return result.map((json) => TransactionModel.fromJson(json)).toList();
  }

  Future<int> updateTransaction(TransactionModel transaction) async {
    final db = await instance.database;
    return db.update(
      transactionTable,
      transaction.toJson(),
      where: '${TransactionFields.id} = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await instance.database;
    return await db.delete(
      transactionTable,
      where: '${TransactionFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future closeDB() async {
    final db = await instance.database;
    db.close();
  }
}
