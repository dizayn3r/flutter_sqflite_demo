import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerFormField extends StatefulWidget {
  final TextEditingController _controller;
  final String _labelText;
  final String _errorText;
  final TextInputType _type;
  const CustomDatePickerFormField( {Key? key,
    required TextEditingController controller,
    required String labelText,
    required String errorText,
    required TextInputType type})
      : _controller = controller,
        _labelText = labelText,
        _errorText = errorText,
        _type = type,
        super(key: key);

  @override
  State<CustomDatePickerFormField> createState() => _CustomDatePickerFormFieldState();
}

class _CustomDatePickerFormFieldState extends State<CustomDatePickerFormField> {
  DateTime selectedDate = DateTime.now();

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
      widget._controller.text = DateFormat('dd/MM/yyyy').format(newDate);
    });
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget._controller,
      keyboardType: widget._type,
      decoration: InputDecoration(
        label: Text(widget._labelText),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget._errorText;
        }
        return widget._controller.text = value.trim();
      },
      onTap: () {
        pickDOB(context);
      },
    );
  }
}
