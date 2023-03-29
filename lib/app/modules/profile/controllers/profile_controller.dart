import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final api = Get.find<GamificationAPI>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getCurrentUser();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCurrentUser() async {
    final _storage = FlutterSecureStorage();

    if (await _storage.read(key: "token") == null) {
      Get.offNamed(Routes.REGISTERATION);
    } else if (GamificationAPI.user.value == null) {
      await api.registerationAPI.getCurrentUser();
    }
  }
}
