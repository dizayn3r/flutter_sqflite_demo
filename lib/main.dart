import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/local/db/app_db.dart';
import 'routes/routes.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(
    Provider(
      create: (context) => AppDb(),
      child: const MyApp(),
      dispose: (context, AppDb db) => db.close(),
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
