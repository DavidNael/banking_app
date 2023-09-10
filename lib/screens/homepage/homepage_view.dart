import 'package:banking_app/screens/homepage/homepage_viewmodel.dart';
import 'package:banking_app/screens/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/route_manager.dart';
import '../resources/strings_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageViewModel>().getUser();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutesPath.customerList,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.people, color: Colors.white),
            SizedBox(width: 10),
            Text(
              AppStrings.showCustomers,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          AppStrings.home,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesPath.customerList,
              );
            },
            icon: const Icon(
              Icons.people,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesPath.transactionHistory,
              );
            },
            icon: const Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream:
            context.watch<HomePageViewModel>().customerStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final customer = snapshot.data!;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          NetworkAssets.bankImage,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
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
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  customer.image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name: ${customer.name}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Balance: ${customer.balance} \$",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            customer.email,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            customer.phone,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            customer.address,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
