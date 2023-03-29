import 'package:get/get.dart';

import '../controllers/all_tournaments_controller.dart';

class AllTournamentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTournamentsController>(
      () => AllTournamentsController(),
    );
  }
}
