import 'package:flutter/material.dart';
import 'package:quizzes/app/utils/constants.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: Constants.font,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      )),
      backgroundColor: MaterialStatePropertyAll(
        Colors.blue.shade900,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
