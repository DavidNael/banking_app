import 'package:flutter/material.dart';

import '../resources/route_manager.dart';
import 'customer_list_viewmodel.dart';

class CustomerListView extends StatelessWidget {
  const CustomerListView({super.key});
  @override
  Widget build(BuildContext context) {
    final CustomerListViewModel viewModel = CustomerListViewModel();
    viewModel.getCustomers();
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.getCustomers();
        },
        child: StreamBuilder(
            stream: viewModel.customersStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final customers = snapshot.data!;
                return ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
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
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            customers[index].image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(customers[index].name),
                        subtitle: Text(customers[index].email),
                        trailing: Text(
                          "${customers[index].balance} \$",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesPath.customerDetail,
                            arguments: customers[index],
                          );
                        },
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
