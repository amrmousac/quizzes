import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GamificationAPI());
    Get.put(InitService());
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
  }
}
