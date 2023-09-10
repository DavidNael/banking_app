import 'dart:async';

import 'package:banking_app/models/customer_model.dart';
import 'package:flutter/cupertino.dart';

import '../../Database/customer_database.dart';

class HomePageViewModel with ChangeNotifier {
  CustomerDatabaseManager databaseManager = CustomerDatabaseManager.instance;
  StreamController<CustomerModel> customerStreamController = StreamController.broadcast();
  Future<void> getUser() async {
    final customer = await databaseManager.readCustomer(11);
    databaseManager.currentUser = customer;
    customerStreamController.add(customer);
    notifyListeners();
  }
}
