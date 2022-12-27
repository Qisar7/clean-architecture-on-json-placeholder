import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;

  MessageWidget({required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Text(message),
        ),
      ),
    );
  }
}
