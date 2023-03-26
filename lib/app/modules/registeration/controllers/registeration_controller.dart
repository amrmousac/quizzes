import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterationController extends GetxController {
  final form = FormGroup({
    // 'username': FormControl<String>(
    //   validators: [Validators.required],
    // ),
    'email': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
  });

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
