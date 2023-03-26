import 'package:flutter/material.dart';

import 'package:quizzes/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(
    const QuizzesApp(),
  );
}
