import 'package:banking_app/Database/transaction_database.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:banking_app/screens/resources/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../Database/customer_database.dart';
import '../../models/customer_model.dart';
import '../homepage/homepage_viewmodel.dart';

class TransferMoneyViewModel with ChangeNotifier {
  final TextEditingController amountController = TextEditingController();

  Future<int?> showCustomerList(BuildContext context) async {
    int? id;
    await CustomerDatabaseManager.instance.readAllCustomers().then(
          (customers) => showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            enableDrag: true,
            context: context,
            builder: (context) {
              return Builder(
                builder: (BuildContext builderContext) {
                  return SafeArea(
                    child: ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            id = customers[index].id;
                            Navigator.pop(context, index);
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              customers[index].image,
                            ),
                          ),
                          title: Text(
                            customers[index].name,
                          ),
                          subtitle: Text(
                            customers[index].email,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
    return id;
  }

  Future<bool> transferMoney(BuildContext context, CustomerModel sender,
      CustomerModel receiver, double amount) async {
    if (sender.balance < amount) {
      return false;
    }
    final customerDb = CustomerDatabaseManager.instance;
    final transactionDb = TransactionDatabaseManager.instance;
    sender.balance -= amount;
    receiver.balance += amount;
    await transactionDb.createTransaction(
      TransactionModel(
          sender: sender.name,
          receiver: receiver.name,
          amount: amount,
          date: DateFormat('dd/MM/yyyy').format(DateTime.now())),
    );
    await customerDb.updateCustomer(sender);
    await customerDb.updateCustomer(receiver).then((value) {
      context.read<HomePageViewModel>().getUser();
      CustomWidgets.showToast(
        text: 'Money Transferred Successfully',
      );

      Navigator.popUntil(context, (route) => route.isFirst);
    });
    customerDb.currentUser = sender;

    return true;
  }
}
