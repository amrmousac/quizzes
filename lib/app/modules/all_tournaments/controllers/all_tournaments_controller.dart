import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class AllTournamentsController extends GetxController {
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
