import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';
import 'package:intl/intl.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({super.key, required this.tournament});

  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offNamed(Routes.RANKING, arguments: tournament);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade900,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  AppText(
                    tournament.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.s22,
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                    ),
                    label: AppText(
                      "${DateFormat("yyyy/MM/dd hh:mm a").format(DateTime.fromMillisecondsSinceEpoch(tournament.createTime! * 1000))}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 32.0,
                runSpacing: 8.0,
                children: [
                  AppText(
                    "Size: ${tournament.size}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  AppText(
                    "Max Size: ${tournament.maxSize}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  AppText(
                    "Operator: ${tournament.tournamentOperator}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
