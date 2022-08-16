import 'package:flutter/material.dart';
import 'package:flutter_sqflite_demo/data/local/db/app_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/employee_notifier.dart';
import '../../../routes/routes.dart';

class EmployeeNotifierStreamScreen extends StatefulWidget {
  const EmployeeNotifierStreamScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeNotifierStreamScreen> createState() =>
      _EmployeeNotifierStreamScreenState();
}

class _EmployeeNotifierStreamScreenState
    extends State<EmployeeNotifierStreamScreen> {
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
    final isLoading = context
        .select<EmployeeNotifier, bool>((notifier) => notifier.isLoading);
    // final employees = context.watch<EmployeeNotifier>().employeeListStream;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Employee Stream'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<EmployeeNotifier>(
              builder: (context, notifier, child) {
                debugPrint("Consumer Stream Widget");
                List employeesList = notifier.employeeListStream;
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: employeesList.length,
                  itemBuilder: (context, index) {
                    final employee = employeesList[index];
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
                              Text(DateFormat('dd/MM/yyyy')
                                  .format(employee.dob)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
