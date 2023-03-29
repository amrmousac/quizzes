import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/group.dart';

class GroupsController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final groups = <Group>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getGroups();

    GamificationAPI.user.listen((p0) {
      getGroups();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getGroups() async {
    groups.clear();
    groups.addAll(await api.groupsAPI.getUserGroups());
    groups.refresh();
  }
}
