import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final api = Get.find<GamificationAPI>();
  final tournaments = Get.find<TournamentService>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
