import 'package:flutter/material.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament_record.dart';
import 'package:intl/intl.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({super.key, required this.record});

  final TournamentRecord record;
  @override
  Widget build(BuildContext context) {
    final isMe = record.ownerId == GamificationAPI.user.value?.user.id;
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: isMe
            ? LinearGradient(
                colors: [
                  ColorManager.primary,
                  ColorManager.secondary,
                ],
              )
            : LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.cyan,
                  Colors.cyan,
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
                  record.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                AppText(
                  "Rank: ${record.rank}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontSize: 32,
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
              runAlignment: WrapAlignment.end,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppText(
                  "Num scores: ${record.numScore ?? 0}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                AppText(
                  record.score != null ? "Score: ${record.score}" : "Score: 0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                AppText(
                  "Last update: ${DateFormat("yyyy/MM/dd hh:mm a").format(record.updateTime)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                /* AppText(
                  "UpdateTime: ${record.updateTime}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
