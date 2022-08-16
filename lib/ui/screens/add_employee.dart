import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_sqflite_demo/data/local/db/app_db.dart';
import 'package:flutter_sqflite_demo/notifiers/employee_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../../widgets/custom_text_form_field.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  late EmployeeNotifier _employeeNotifier;

  @override
  void initState() {
    _employeeNotifier = Provider.of<EmployeeNotifier>(context, listen: false);
    _employeeNotifier.addListener(providerListener);
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _dateOfBirth.dispose();
    _employeeNotifier.dispose();
    super.dispose();
  }

  Future<void> pickDOB(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.red,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''),
      ),
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      selectedDate = newDate;
      _dateOfBirth.text = DateFormat('dd/MM/yyyy').format(newDate);
    });
  }

  void addEmployee() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null ) {
      final entity = EmployeeCompanion(
        userName: drift.Value(_username.text),
        firstName: drift.Value(_firstName.text),
        lastName: drift.Value(_lastName.text),
        dob: drift.Value(selectedDate),
      );


      context.read<EmployeeNotifier>().createEmployee(entity);


      // Provider.of<AppDb>(context,listen: false).insertEmployee(entity).then(
      //       (value) => ScaffoldMessenger.of(context).showMaterialBanner(
      //     MaterialBanner(
      //       backgroundColor: Colors.white,
      //       content: Text('New employee added: $value'),
      //       actions: [
      //         ElevatedButton(
      //           onPressed: () {
      //             ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      //             Navigator.pushNamedAndRemoveUntil(
      //                 context, Routes.home, (route) => false);
      //           },
      //           child: const Text('Close'),
      //         )
      //       ],
      //     ),
      //   ),
      // );
      
    }
  }

  void providerListener(){
    if(_employeeNotifier.isAdded){
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          backgroundColor: Colors.white,
          content: const Text('New employee added.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.home, (route) => false);
              },
              child: const Text('Close'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Employee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_rounded),
            onPressed: addEmployee,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _username,
                labelText: 'User Name',
                errorText: "Username cannot be empty.",
                type: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: _firstName,
                labelText: 'First Name',
                errorText: "First name cannot be empty.",
                type: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: _lastName,
                labelText: 'Last Name',
                errorText: "Last name cannot be empty.",
                type: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
              CustomDatePickerFormField(
                controller: _dateOfBirth,
                type: TextInputType.datetime,
                labelText: 'Date of Birth',
                callback: () => pickDOB(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
