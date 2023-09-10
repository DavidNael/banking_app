import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../Database/customer_database.dart';
import '../../models/customer_model.dart';

class CustomerListViewModel with ChangeNotifier {
  CustomerDatabaseManager databaseManager = CustomerDatabaseManager.instance;
  StreamController customersStreamController = StreamController<List<CustomerModel>>.broadcast();
  Future<void> getCustomers() async {
    final customers = await databaseManager.readAllCustomers();
    customers.removeWhere((customer) => customer.name == "Main User");
    customersStreamController.add(customers);
  }
}
