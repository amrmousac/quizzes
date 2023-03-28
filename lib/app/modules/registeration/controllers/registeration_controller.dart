import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterationController extends GetxController {
  final api = Get.find<GamificationAPI>();
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

  Future<void> login() async {
   /* final res = await api.login();
    print("token sss: ${api.accessToken}");

    if (res) {
      Get.toNamed(Routes.PLAY);
    }*/
     Get.toNamed(Routes.PLAY);
  }
}
