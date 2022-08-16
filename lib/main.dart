import 'package:flutter/material.dart';
import 'package:flutter_sqflite_demo/notifiers/employee_notifier.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'data/local/db/app_db.dart';
import 'routes/routes.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: AppDb()),
        ChangeNotifierProxyProvider<AppDb , EmployeeNotifier>(
          create: (context) => EmployeeNotifier(),
          update: (context,  db, notifier) => notifier!..initAppDb(db)..getEmployeeFuture(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: Routes.getRoute,
      home: const HomeScreen(),
    );
  }
}
