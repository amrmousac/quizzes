import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/services/api_service.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GamificationAPI());
    Get.put(InitService());
    Get.put(TournamentService());
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
  }
}
