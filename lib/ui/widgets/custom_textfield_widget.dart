import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  bool enabled;
  //final FormFieldValidator<String> validator;

  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.keyboardType,
      required this.enabled
      //required this.validator,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        //contentPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
        isDense: true,
        labelText: label,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "* Required";
        } else {
          return null;
        }
      },
    );
  }
}
