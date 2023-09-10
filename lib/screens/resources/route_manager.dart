import 'package:banking_app/screens/customer_details/customer_details_view.dart';
import 'package:banking_app/screens/resources/strings_manager.dart';
import 'package:banking_app/screens/transaction_history/transaction_history_view.dart';
import 'package:banking_app/screens/transfer_money/transfer_money_view.dart';
import 'package:flutter/material.dart';

import '../customer_list/customer_list_view.dart';
import '../homepage/homepage_view.dart';
import '../../models/customer_model.dart';
import '../splash/splash_view.dart';

abstract class RoutesPath {
  static const String splashScreen = '/splash-screen';
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String profile = '/profile';
  static const String transferMoney = '/transfer-money';
  static const String customerDetail = '/customer-detail';
  static const String customerList = '/customer-list';
  static const String transactionHistory = '/transaction-history';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPath.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesPath.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesPath.customerList:
        return MaterialPageRoute(builder: (_) => const CustomerListView());
      case RoutesPath.customerDetail:
        return MaterialPageRoute(
            builder: (_) => CustomerDetailsView(
                  customer: settings.arguments as CustomerModel,
                ));
      case RoutesPath.transferMoney:
        return MaterialPageRoute(
            builder: (_) => TransferMoneyView(
                  customer: settings.arguments as CustomerModel,
                ));
      case RoutesPath.transactionHistory:
        return MaterialPageRoute(
            builder: (_) => const TransactionHistoryView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${AppStrings.undefinedRoute} ${settings.name}'),
            ),
          ),
        );
    }
  }
}
