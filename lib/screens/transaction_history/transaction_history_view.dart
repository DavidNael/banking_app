import 'package:banking_app/screens/transaction_history/transaction_history_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../models/transaction_model.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final TransactionHistoryViewModel viewModel = TransactionHistoryViewModel();
    viewModel.getTransactions();
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.getTransactions();
        },
        child: StreamBuilder<List<TransactionModel>>(
            stream: viewModel.transactionsStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final transactions = snapshot.data!;
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(transactions[index].sender),
                              Column(
                                children: [
                                  Text(
                                    "${transactions[index].amount} \$",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.arrow_right_alt),
                                ],
                              ),
                              Text(transactions[index].receiver),
                            ],
                          ),
                          Text(transactions[index].date)
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
