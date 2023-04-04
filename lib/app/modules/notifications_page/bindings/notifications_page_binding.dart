import 'package:get/get.dart';

import '../controllers/notifications_page_controller.dart';

class NotificationsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationsPageController>(
      NotificationsPageController(),
    );
  }
}
