import 'package:flutter/foundation.dart' show kIsWeb;

class AppConstants {
  static const int splashDelay = 3;
  static const double iconSize = 300;
  static const double leadingWidth = 70;

  static const operators = {
    0: "Best",
    1: "Set",
    2: "Increment",
    3: "Decrement",
    4: "Min",
    5: "Max",
    6: "Sum",
    7: "Last"
  };

  static bool get isWeb {
    if (kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static String get baseUrl => isWeb ? "127.0.0.1" : "192.168.119.1";
}
