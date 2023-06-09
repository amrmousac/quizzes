import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class AllTournamentsController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final myTournaments = <Tournament>[].obs;
  final myTournamentsIds = <String>[].obs;
  final allTournaments = <Tournament>[].obs;

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
