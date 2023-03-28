import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';

import '../controllers/quize_controller.dart';

class QuizeView extends GetView<QuizeController> {
  const QuizeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppPage(
        child: Scaffold(
          appBar: AppBar(
            title: Text("${controller.res.value}"),
            centerTitle: true,
          ),
          body: ElevatedButton(child: Text("test"), onPressed: () async {}),
        ),
      ),
    );
  }
}
