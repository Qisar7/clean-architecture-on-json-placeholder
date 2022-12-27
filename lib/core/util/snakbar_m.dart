import 'package:flutter/material.dart';

class MySnakBar {
  static void successsnakbarmessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.green,
    ));
  }

  static void errorsnakbarmessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
