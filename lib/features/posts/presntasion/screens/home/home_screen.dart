import '../post_screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> screens = [
    PostScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
