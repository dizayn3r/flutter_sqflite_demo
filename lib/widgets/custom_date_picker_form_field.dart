import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatelessWidget {

  final TextEditingController _controller;
  final String _labelText;
  final TextInputType _type;
  final VoidCallback _callback;

  const CustomDatePickerFormField(
      {Key? key,
      required TextEditingController controller,
      required String labelText,
      required TextInputType type,
      required VoidCallback callback})
      : _controller = controller,
        _labelText = labelText,
        _type = type,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: _controller,
      keyboardType: _type,
      decoration: InputDecoration(
        label: Text(_labelText),
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
          return "$_labelText cannot be empty";
        }
        return _controller.text = value.trim();
      },
      onTap: _callback,
    );
  }
}
