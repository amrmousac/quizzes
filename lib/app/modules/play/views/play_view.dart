import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: const Center(
        child: Text(
          'PlayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
