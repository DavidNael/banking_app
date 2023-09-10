import 'package:banking_app/Database/transaction_database.dart';
import 'package:banking_app/screens/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import '../../Database/customer_database.dart';
import '../resources/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> initDatabase() async {
    await Future.delayed(const Duration(seconds: AppConstants.splashTime));
    await CustomerDatabaseManager.instance.database;
    await TransactionDatabaseManager.instance.database;
  }

  @override
  void initState() {
    initDatabase().then((_) {
      Navigator.pushReplacementNamed(context, RoutesPath.home);
    }).catchError((error) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFA000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Screen',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
