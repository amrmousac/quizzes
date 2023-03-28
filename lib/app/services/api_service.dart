import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class InitService extends GetxService {
  final api = Get.find<GamificationAPI>();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> init() async {
    await api.tokenRefresh();
    GamificationAPI.user.value = await api.registerationAPI.getCurrentUser();
  }
}
