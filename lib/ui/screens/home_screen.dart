import 'package:flutter/material.dart';
import 'package:flutter_sqflite_demo/ui/screens/By%20using%20notifier/employee_notifier_stream.dart';
import 'package:flutter_sqflite_demo/ui/screens/employee_future.dart';
import 'package:flutter_sqflite_demo/ui/screens/By%20using%20notifier/employee_notifier_future.dart';
import 'package:flutter_sqflite_demo/ui/screens/employee_stream.dart';

import '../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = [
    const EmployeeFutureScreen(),
    // const EmployeeNotifierFutureScreen(),
    const EmployeeStreamScreen(),
    // const EmployeeNotifierStreamScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, Routes.add_employee),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list),
            label: "Employee Future",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list),
            label: "Employee Stream",
          ),
        ],
      ),
      body: pages[index],
    );
  }
}