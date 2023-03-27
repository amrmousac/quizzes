import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/services/initial_bindings.dart';
import 'package:quizzes/app/utils/resources/theme_manager.dart';
import 'package:quizzes/app/utils/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class QuizzesApp extends StatelessWidget {
  const QuizzesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: "Quizzes",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: InitialBinding(),
        theme: appTheme,
      );
    });
  }
}
