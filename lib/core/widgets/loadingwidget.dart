import 'package:flutter/material.dart';

import '../apptheme/color_manger.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: CircularProgressIndicator(
          color: MyColors.deepblue,
        ),
      ),
    );
  }
}
