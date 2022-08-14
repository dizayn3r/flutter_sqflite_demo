import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final TextInputType type;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.errorText,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        label: Text(labelText),
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
          return errorText;
        }
        return controller.text = value.trim();
      },
      onFieldSubmitted: (value) {
        controller.text = value.trim();
        print(controller.text);
      },
    );
  }
}