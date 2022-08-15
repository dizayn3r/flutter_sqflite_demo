import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_sqflite_demo/data/local/db/app_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../../widgets/custom_text_form_field.dart';

class EditEmployee extends StatefulWidget {
  final int id;
  const EditEmployee({Key? key, required this.id}) : super(key: key);

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  late EmployeeData _employeeData;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    getEmployee();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _dateOfBirth.dispose();
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

  Future<void> getEmployee() async {
    _employeeData = await Provider.of<AppDb>(context, listen: false).getEmployee(widget.id);
    _username.text = _employeeData.userName;
    _firstName.text = _employeeData.firstName;
    _lastName.text = _employeeData.lastName;
    _dateOfBirth.text = DateFormat('dd/MM/yyyy').format(_employeeData.dob);
  }

  void editEmployee() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null) {
      final entity = EmployeeCompanion(
        id: drift.Value(widget.id),
        userName: drift.Value(_username.text),
        firstName: drift.Value(_firstName.text),
        lastName: drift.Value(_lastName.text),
        dob: drift.Value(selectedDate),
      );
      Provider.of<AppDb>(context,listen: false).updateEmployee(entity).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.white,
                content: Text('Employee details updated: $value'),
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
            ),
          );
    }
  }

  //Delete employee
  void deleteEmployee() {
    Provider.of<AppDb>(context,listen: false).deleteEmployee(widget.id).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.white,
              content: Text('Employee record deleted: $value'),
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
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Employee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_rounded),
            onPressed: editEmployee,
          ),
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: deleteEmployee,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Employee ID: ${widget.id}"),
              const SizedBox(height: 16.0),
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
