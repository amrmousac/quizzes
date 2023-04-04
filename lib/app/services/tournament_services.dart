import 'dart:async';

import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/notifications.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_record.dart';
import 'package:collection/collection.dart';

class TournamentService extends GetxService {
  final api = Get.find<GamificationAPI>();
  final myTournaments = <Tournament>[].obs;
  final allTournaments = <Tournament>[].obs;
  final pointsTournaments = <Tournament>[].obs;
  final pointsTournamentsRecords = <TournamentRecord>[].obs;
  final score = "0".obs;
  final myTournamentsIds = <String>[].obs;
  final notifications = Rx<Notifications?>(null);

  final newNotificationsCount = 0.obs;
  final notificationsCount = 0.obs;

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
    pointsTournaments.clear();
    myTournaments.addAll(await api.tournamentsAPI.getUserTournaments());
    allTournaments.addAll(await api.tournamentsAPI.getAllTournaments());
    myTournamentsIds
        .addAll(myTournaments.map((element) => element.id).toList());
    pointsTournaments
        .addAll(myTournaments.where((p0) => p0.collection == "points"));
    await getTournamentsRecords();
    myTournaments.refresh();
    allTournaments.refresh();
    pointsTournaments.refresh();
    getAllNotifications();
    Timer.periodic(Duration(seconds: 15), (Timer t) {
      getAllNotifications();
    });
  }

  Future<void> getTournamentsRecords() async {
    pointsTournamentsRecords.clear();
    for (var element in pointsTournaments) {
      pointsTournamentsRecords.addAll(
        await api.tournamentsAPI.getTournamentRecordsAroundUser(element),
      );
    }
    score.value = pointsTournamentsRecords.firstOrNull?.score ?? "0";
  }

  Future<void> getAllNotifications() async {
    notifications.value = await api.notificationsAPI.getAllNotifications();
    if ((notifications.value?.notifications.length ?? 0) >
        notificationsCount.value) {
      newNotificationsCount.value =
          (notifications.value?.notifications.length ?? 0) -
              notificationsCount.value;
    }
    notificationsCount.value = notifications.value?.notifications.length ?? 0;
  }
}
