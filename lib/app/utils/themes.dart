import 'package:flutter/material.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';

ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    // iconTheme: IconThemeData(color: Colors.blue.shade900),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.secondary,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        )),
        backgroundColor: MaterialStatePropertyAll(
          ColorManager.primary,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ));
