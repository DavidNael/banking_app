import 'package:banking_app/screens/customer_details/customer_details_viewmodel.dart';
import 'package:banking_app/screens/customer_list/customer_list_viewmodel.dart';
import 'package:banking_app/screens/homepage/homepage_view.dart';
import 'package:banking_app/screens/homepage/homepage_viewmodel.dart';
import 'package:banking_app/screens/resources/route_manager.dart';
import 'package:banking_app/screens/transfer_money/transfer_money_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerDetailsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransferMoneyViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking App',
        initialRoute: RoutesPath.splashScreen,
        onGenerateRoute: RoutesGenerator.getRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
