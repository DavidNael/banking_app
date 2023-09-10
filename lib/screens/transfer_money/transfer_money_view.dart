import 'package:banking_app/Database/customer_database.dart';
import 'package:banking_app/screens/resources/strings_manager.dart';
import 'package:banking_app/screens/transfer_money/transfer_money_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../models/customer_model.dart';

class TransferMoneyView extends StatelessWidget {
  final CustomerModel customer;

  const TransferMoneyView({required this.customer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransferMoneyViewModel viewmodel = TransferMoneyViewModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.transferMoney,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Row(
              children: [
                Text(
                  "From: ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Main User",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                  "To: ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  customer.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: viewmodel.amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await viewmodel.transferMoney(
                  context,
                  CustomerDatabaseManager.instance.currentUser,
                  customer,
                  double.parse(viewmodel.amountController.text),
                );
              },
              child: const Text(
                "Transfer",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
