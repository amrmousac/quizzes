import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/data/api.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Center(
        child: Obx(
          () => Text(
            'ProfileView is ${GamificationAPI.user.value?.email}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
