import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';

import '../controllers/tournaments_controller.dart';

class TournamentsView extends GetView<TournamentsController> {
  const TournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: const Center(
        child: Text(
          'TournamentsView is d d working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
