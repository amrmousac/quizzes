import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/quize/views/quiz_widget.dart';
import 'package:quizzes/app/modules/singleGroup/views/single_group_widget.dart';

import '../controllers/quize_controller.dart';

class QuizeView extends GetView<QuizeController> {
  const QuizeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(child: Center(child: QuizWidget()));
  }
}



