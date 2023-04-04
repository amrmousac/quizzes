import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterationController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final loginForm = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required],
      value: kDebugMode ? "mustafa@gmail.com" : null,
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
      value: kDebugMode ? "3bc8f72e95a9‏" : null,
    ),
  });

  final signupForm = FormGroup({
    'username': FormControl<String>(
      validators: [Validators.required],
    ),
    'email': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
    'confirmPassword': FormControl<String>(
      validators: [Validators.required],
    ),
  });
  final errorMessage = ''.obs;
  final isLogin = true.obs;

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
    final res = await api.registerationAPI.login(
        loginForm.control('email').value, loginForm.control('password').value);
    if (res['status'] == 200) {
      Get.toNamed(Routes.HOME);
    } else {
      errorMessage.value = res['message'];
    }
  }

  Future<void> signup() async {
    final res = await api.registerationAPI.signup(
        signupForm.control('username').value,
        signupForm.control('email').value,
        signupForm.control('password').value);
    if (res['status'] == 200) {
      Get.toNamed(Routes.HOME);
    } else {
      errorMessage.value = res['message'];
    }
  }
}
