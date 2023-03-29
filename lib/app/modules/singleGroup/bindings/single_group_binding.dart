import 'package:get/get.dart';

import '../controllers/single_group_controller.dart';

class SingleGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleGroupController>(
      () => SingleGroupController(),
    );
  }
}
