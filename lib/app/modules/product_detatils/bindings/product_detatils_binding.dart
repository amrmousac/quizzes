import 'package:get/get.dart';

import '../controllers/product_detatils_controller.dart';

class ProductDetatilsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetatilsController>(
      () => ProductDetatilsController(),
    );
  }
}
