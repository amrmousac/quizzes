import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _InfoItem(
                          title: "Creation time",
                          content:
                              "${DateFormat('yyyy/MM/dd hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(tournament.createTime! * 1000))}"),
                      _InfoItem(
                          title: "Duration",
                          content:
                              "${DateFormat('yyyy/MM/dd hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(tournament.duration! * 1000))}"),
                      _InfoItem(
                          title: "Operatior",
                          content: tournament.tournamentOperator),
                      _InfoItem(
                          title: "Max score",
                          content: "${tournament.maxNumScore}"),
                    ],
                  ),
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

class _InfoItem extends StatelessWidget {
  const _InfoItem({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText("$title : "),
            AppText(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
