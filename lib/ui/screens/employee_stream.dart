import 'package:flutter/material.dart';
import 'package:flutter_sqflite_demo/data/local/db/app_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';

class EmployeeStreamScreen extends StatefulWidget {
  const EmployeeStreamScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeStreamScreen> createState() => _EmployeeStreamScreenState();
}

class _EmployeeStreamScreenState extends State<EmployeeStreamScreen> {


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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Employee Stream'),
      ),
      body: StreamBuilder<List<EmployeeData>>(
        stream: Provider.of<AppDb>(context).getEmployeeStream(),
        builder: (context, snapshot) {
          final List<EmployeeData>? employees = snapshot.data;
          // if (snapshot.connectionState != ConnectionState.done) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          //Show error
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          //Show data
          if (employees != null) {
            if (employees.isEmpty) {
              return const Center(child: Text('No employee data is found....'));
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, Routes.edit_employee,
                        arguments: employee.id),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: const BorderSide(
                          color: Colors.deepOrange,
                          width: 1.2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${employee.id}"),
                            Text(employee.userName),
                            Text(employee.firstName),
                            Text(employee.lastName),
                            Text(DateFormat('dd/MM/yyyy').format(employee.dob)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('No Data Found'));
          }
        },
      ),
    );
  }
}
