import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_record.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class RankingController extends GetxController {
  final api = Get.find<GamificationAPI>();
  var tournament = Get.arguments as Tournament?;
  final records = <TournamentRecord>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (tournament == null) {
      Get.offNamed(Routes.TOURNAMENTS);
    }
    getRecords();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getRecords() async {
    if (tournament != null) {
      records.clear();
      records.addAll(
          await api.tournamentsAPI.getTournamentRecordsAroundUser(tournament!));
      records.refresh();
    }
  }
}
