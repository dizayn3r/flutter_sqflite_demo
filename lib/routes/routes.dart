import 'package:flutter/material.dart';

import '../ui/screens/edit_employee.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/add_employee.dart';

class Routes {
  // Getting arguments passed in while calling Navigator.pushNamed

  static const home = '/';
  static const add_employee = '/add_employee';
  static const edit_employee = 'edit_employee';

  static Route<dynamic> getRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.add_employee:
        return MaterialPageRoute(builder: (_) => const AddEmployee());
      case Routes.edit_employee:
        if(args is int){
          return MaterialPageRoute(builder: (_) => EditEmployee(id: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  buildRoute(RouteSettings settings, Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('No Route'),
          ),
          body: const Center(
            child: Text(
              'Sorry no route was found!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
