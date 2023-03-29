import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';

class InitService extends GetxService {
  @override
  void onInit() {
    super.onInit();
    Get.find<GamificationAPI>().tokenRefresh();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
