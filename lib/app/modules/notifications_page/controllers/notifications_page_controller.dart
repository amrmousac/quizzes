import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class NotificationsPageController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final tournaments = Get.find<TournamentService>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tournaments.newNotificationsCount.value = 0;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> delete(String id) async {
    await api.notificationsAPI.deleteNotifications(id);
    tournaments.notifications.value?.notifications
        .removeWhere((element) => element.id == id);
    tournaments.notifications.refresh();
  }
}
