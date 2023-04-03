import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class TournamentService extends GetxService {
  final api = Get.find<GamificationAPI>();
  final myTournaments = <Tournament>[].obs;
  final allTournaments = <Tournament>[].obs;
  final myTournamentsIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    GamificationAPI.user.listen((p0) {
      if (p0 != null) {
        getTournaments();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTournaments() async {
    myTournaments.clear();
    allTournaments.clear();
    myTournamentsIds.clear();
    myTournaments.addAll(await api.tournamentsAPI.getUserTournaments());
    allTournaments.addAll(await api.tournamentsAPI.getAllTournaments());
    myTournamentsIds
        .addAll(myTournaments.map((element) => element.id).toList());
    myTournaments.refresh();
    allTournaments.refresh();
  }
}
