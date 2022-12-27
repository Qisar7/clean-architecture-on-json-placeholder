import 'package:flutter/material.dart';

class Formfieldwidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool multiline;

  const Formfieldwidget(
      {required this.name, required this.controller, required this.multiline});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: multiline ? 5 : 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        hintText: name,
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return '$name cant be empty';
        } else {
          return null;
        }
      },
    );
  }
}
