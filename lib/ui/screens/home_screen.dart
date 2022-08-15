import 'package:flutter/material.dart';
import 'package:flutter_sqflite_demo/data/local/db/app_db.dart';
import '../../ui/screens/employee_future.dart';
import '../../ui/screens/employee_stream.dart';
import 'package:intl/intl.dart';

import '../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  late AppDb _db;

  final pages = [
    const EmployeeFutureScreen(),
    const EmployeeStreamScreen(),
  ];

  @override
  void initState() {
    _db = AppDb();
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, Routes.add_employee),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Employee'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value){
          setState((){
            index = value;
          });
        },
        items: const [
        BottomNavigationBarItem(
          icon:Icon(Icons.list),
          activeIcon: Icon(Icons.list),
          label: "Employee Future",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          activeIcon: Icon(Icons.list),
          label: "Employee Stream",
        ),
      ],),
      // body: FutureBuilder<List<EmployeeData>>(
      //   future: _db.getEmployees(),
      //   builder: (context, snapshot) {
      //     final List<EmployeeData>? employees = snapshot.data;
      //     if (snapshot.connectionState != ConnectionState.done) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //
      //     //Show error
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text("${snapshot.error}"),
      //       );
      //     }
      //
      //     //Show data
      //     if (employees != null) {
      //       if (employees.isEmpty) {
      //         return const Center(child: Text('No employee data is found....'));
      //       } else {
      //         return ListView.builder(
      //           padding: const EdgeInsets.all(8.0),
      //           itemCount: employees.length,
      //           itemBuilder: (context, index) {
      //             final employee = employees[index];
      //             return GestureDetector(
      //               onTap: () => Navigator.pushNamed(
      //                   context, Routes.edit_employee,
      //                   arguments: employee.id),
      //               child: Card(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                   side: const BorderSide(
      //                     color: Colors.deepOrange,
      //                     width: 1.2,
      //                   ),
      //                 ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(12.0),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text("${employee.id}"),
      //                       Text(employee.userName),
      //                       Text(employee.firstName),
      //                       Text(employee.lastName),
      //                       Text(DateFormat('dd/MM/yyyy').format(employee.dob)),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      //       }
      //     } else {
      //       return const Center(child: Text('No Data Found'));
      //     }
      //   },
      // ),
      body: pages[index],
    );
  }
}
