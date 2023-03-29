import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/group.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';

class groupCard extends StatelessWidget {
  const groupCard({super.key, required this.group});

  final Group group;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(group.group.avatarUrl, scale: 40),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    AppText(
                      group.group.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.s22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                  ),
                  label: AppText(
                    "${group.group.createTime}",
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
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppText(
                  "lang: ${group.group.langTag}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                AppText(
                  "Max Size: ${group.group.maxCount}",
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
    );
  }
}
