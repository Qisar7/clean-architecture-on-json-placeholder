import 'package:flutter/material.dart';

import 'color_manger.dart';

class Themedata {
  static ThemeData themeData = ThemeData(
      primaryColor: MyColors.deepblue,
      // colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: MyColors.blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyColors.blue,
      ));
}
