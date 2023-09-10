import 'dart:async';

import 'package:banking_app/Database/transaction_database.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';

class TransactionHistoryViewModel with ChangeNotifier {
  TransactionDatabaseManager databaseManager =
      TransactionDatabaseManager.instance;
  StreamController<List<TransactionModel>> transactionsStreamController =
      StreamController<List<TransactionModel>>.broadcast();
  Future<void> getTransactions() async {
    final customers = await databaseManager.readAllTransactions();
    transactionsStreamController.add(customers);
  }
}
