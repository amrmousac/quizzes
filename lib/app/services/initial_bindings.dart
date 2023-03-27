import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GamificationAPI());
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
  }
}
