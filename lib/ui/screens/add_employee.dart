import 'package:flutter/material.dart';

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

  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Employee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_rounded),
            onPressed: () {
              //TODO
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _username,
              labelText: 'User Name',
              errorText: "Username cannot be empty.",
              type: TextInputType.name,
            ),
            SizedBox(height: 16.0),
            CustomTextFormField(
              controller: _firstName,
              labelText: 'First Name',
              errorText: "First name cannot be empty.",
              type: TextInputType.name,
            ),
            SizedBox(height: 16.0),
            CustomTextFormField(
              controller: _lastName,
              labelText: 'Last Name',
              errorText: "Last name cannot be empty.",
              type: TextInputType.name,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
