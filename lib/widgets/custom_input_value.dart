import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputValue extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  CustomInputValue({@required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}

