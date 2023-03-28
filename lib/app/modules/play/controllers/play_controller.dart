import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class PlayController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final tournaments = <Tournament>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getTournaments();
    GamificationAPI.user.listen((p0) {
      getTournaments();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTournaments() async {
    tournaments.clear();
    tournaments.addAll(await api.tournamentsAPI.getUserTournaments());
    tournaments.refresh();
  }
}
