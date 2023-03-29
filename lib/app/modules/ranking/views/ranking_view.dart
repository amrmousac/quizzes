import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/ranking/views/components/record_card.dart';
import 'package:quizzes/app/modules/ranking/views/ranking_widget.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';

import '../../../components/page/app_page.dart';
import '../controllers/ranking_controller.dart';

class RankingView extends GetView<RankingController> {
  const RankingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tournament = controller.tournament;

    return AppPage(child: Obx(
      () {
        controller.records.refresh();
        if (tournament == null) return Container();
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    tournament.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 56,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  AppText(
                    tournament.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  // SizedBox(
                  //   height: 8.0,
                  // ),
                  //   AppText(
                  //  "${tournament.maxNumScore}",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 56,
                  //   ),
                  // ),
                  SizedBox(
                    height: 32.0,
                  ),
                  ...controller.records
                      .map((element) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: RecordCard(record: element),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
