import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Center(
        child: Text(
          'ProfileView is ${controller.api.registerationAPI.user?.email}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
