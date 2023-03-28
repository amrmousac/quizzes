import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final api = Get.put(GamificationAPI());
    if (GamificationAPI.user == null) {
      if (GamificationAPI.refreshToken == null) {
        api.tokenRefresh();
        return const RouteSettings(name: Routes.REGISTERATION);
      } else {
        api.registerationAPI.getCurrentUser();
        return null;
      }
    }
    return null;
  }
}
