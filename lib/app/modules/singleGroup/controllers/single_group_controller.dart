import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/group.dart';
import 'package:quizzes/app/models/group_user.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class SingleGroupController extends GetxController {
  final api = Get.find<GamificationAPI>();
  var group = Get.arguments as Group?;
  final users = <GroupUser>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (group == null) {
      Get.offNamed(Routes.GROUPS);
    }
    getUsers();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getUsers() async {
    if (group != null) {
      users.clear();
      users.addAll(await api.groupsAPI.getGroupUsers(group!.group.id));
      users.refresh();
    }
  }
}
