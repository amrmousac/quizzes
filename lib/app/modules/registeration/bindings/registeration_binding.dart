import 'package:get/get.dart';

import '../controllers/registeration_controller.dart';

class RegisterationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterationController>(
      RegisterationController(),
    );
  }
}
