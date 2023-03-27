import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import '../../../components/page/app_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
