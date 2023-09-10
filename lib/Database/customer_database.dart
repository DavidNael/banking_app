import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../models/customer_model.dart';

class CustomerDatabaseManager {
  static final CustomerDatabaseManager instance =
      CustomerDatabaseManager._init();
  static Database? _database;
  CustomerDatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('customer.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    if (kDebugMode) print("Init Customer DB");
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
    if (kDebugMode) print("Create Customer DB");
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NOT NULL';
    // const String boolType = 'BOOLEAN NOT NULL';
    const String doubleType = 'DOUBLE NOT NULL';
    await db.execute(''' 
      CREATE TABLE $customerTable (
        ${CustomerFields.id} $idType,
        ${CustomerFields.name} $textType,
        ${CustomerFields.address} $textType,
        ${CustomerFields.phone} $textType,
        ${CustomerFields.email} $textType,
        ${CustomerFields.balance} $doubleType,
        ${CustomerFields.image} $textType
      )
''');

    /// Create Dummy Data
    for (int i = 0; i < 10; i++) {
      await db.insert(
        customerTable,
        CustomerModel(
          name: Faker().person.firstName(),
          email: '${Faker().person.firstName()}@example.com',
          address: Faker().address.country(),
          phone: "0123456789",
          balance: Faker().randomGenerator.decimal(min: 100, scale: 10000).roundToDouble(),
          image: 'https://picsum.photos/200/300',
        ).toJson(),
      );
    }

    /// Create Main User
    await db.insert(
      customerTable,
      CustomerModel(
        name: 'Main User',
        email: 'mainuser@example.com',
        address: Faker().address.country(),
        phone: Faker().phoneNumber.us(),
        balance: 10000,
        image: 'https://picsum.photos/200/300',
      ).toJson(),
    );
  }

  late CustomerModel currentUser;

  Future<CustomerModel> createCustomer(CustomerModel customer) async {
    final db = await instance.database;
    final id = await db.insert(customerTable, customer.toJson());
    return customer.copyWith(id: id);
  }

  Future<CustomerModel> readCustomer(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      customerTable,
      columns: CustomerFields.values,
      where: '${CustomerFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CustomerModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<CustomerModel>> readAllCustomers() async {
    final db = await instance.database;
    const orderBy = '${CustomerFields.id} ASC';
    final result = await db.query(customerTable, orderBy: orderBy);
    return result.map((json) => CustomerModel.fromJson(json)).toList();
  }

  Future<int> updateCustomer(CustomerModel customer) async {
    final db = await instance.database;
    return db.update(
      customerTable,
      customer.toJson(),
      where: '${CustomerFields.id} = ?',
      whereArgs: [customer.id],
    );
  }

  Future<int> deleteCustomer(int id) async {
    final db = await instance.database;
    return await db.delete(
      customerTable,
      where: '${CustomerFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future closeDB() async {
    final db = await instance.database;
    db.close();
  }

  Future dropTable() async {
    final db = await instance.database;
    db.execute('DROP TABLE IF EXISTS $customerTable');
  }
}
