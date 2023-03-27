import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';

class QuizeController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final res = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
