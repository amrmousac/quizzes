import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/modules/ranking/views/ranking_widget.dart';

import '../../../components/page/app_page.dart';
import '../controllers/ranking_controller.dart';

class RankingView extends GetView<RankingController> {
  const RankingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppPage(child: Center(child: RankingWidget(tournamentName: "Tournament Name",numOfUsers:"500")));
  }
}
