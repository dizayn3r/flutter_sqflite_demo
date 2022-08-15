import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController _controller;
  final String _labelText;
  final String _errorText;
  final TextInputType _type;
  const CustomTextFormField(
      {Key? key,
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
  Widget build(BuildContext context) {
    return TextFormField(
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
          return _errorText;
        }
        return _controller.text = value.trim();
      },
      onFieldSubmitted: (value) {
        _controller.text = value.trim();
        // log("Response ===>>> ${_controller.text}");
      },
    );
  }
}
