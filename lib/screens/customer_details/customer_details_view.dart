import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/screens/resources/route_manager.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class CustomerDetailsView extends StatelessWidget {
  final CustomerModel customer;

  const CustomerDetailsView({required this.customer, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          customer.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // Add bold text
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutesPath.transferMoney,
            arguments: customer,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Change button color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 2, // Add shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Add rounded corners
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.monetization_on,
              color: Colors.white, // Change icon color
            ),
            SizedBox(width: 10),
            Text(
              AppStrings.transferMoney,
              style: TextStyle(
                color: Colors.white, // Change text color
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // Adjust padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), // Make it circular
                  child: Image.network(
                    customer.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add spacing
              Center(
                child: Text(
                  customer.name,
                  style: const TextStyle(
                    fontSize: 24, // Increase font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${customer.balance} \$",
                  style: const TextStyle(
                    fontSize: 24, // Increase font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add spacing
              Text(
                customer.email,
                style: const TextStyle(
                  fontSize: 16, // Increase font size
                ),
              ),
              Text(
                customer.phone,
                style: const TextStyle(
                  fontSize: 16, // Increase font size
                ),
              ),
              Text(
                customer.address,
                style: const TextStyle(
                  fontSize: 14, // Increase font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
