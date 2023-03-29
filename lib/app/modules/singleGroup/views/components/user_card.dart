import 'package:flutter/material.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/group.dart';
import 'package:quizzes/app/models/group_user.dart';
import 'package:quizzes/app/models/tournament_record.dart';
import 'package:quizzes/app/models/user.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final GroupUser user;
  @override
  Widget build(BuildContext context) {
    final isMe = user.user.id == GamificationAPI.user.value?.user.id;
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: isMe
            ? LinearGradient(
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade400,
                  Colors.blue.shade400,
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
                  user.user.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.s22,
                    color: Colors.white,
                  ),
                ),
                // if (user.score != null)
                //   AppText(
                //     "Score: ${user.score}",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
              ],
            ),
          ),
          Divider(),
          // SizedBox(
          //   width: double.infinity,
          //   child: Wrap(
          //     alignment: WrapAlignment.spaceEvenly,
          //     runAlignment: WrapAlignment.start,
          //     spacing: 8.0,
          //     runSpacing: 8.0,
          //     children: [
          //       AppText(
          //         "rank: ${user.rank}",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //       AppText(
          //         "UpdateTime: ${user.updateTime}",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
