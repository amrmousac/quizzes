import 'package:flutter/material.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';

ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    iconTheme: IconThemeData(color: Colors.blue.shade900),
    scaffoldBackgroundColor: Colors.grey.shade100,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue.shade900,
    ),
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
    ));
