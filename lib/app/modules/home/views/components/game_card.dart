import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class PlayGameCard extends StatelessWidget {
  const PlayGameCard({super.key, required this.tournament});
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.QUIZE, arguments: tournament);
      },
      child: Container(
        height: 120,
        width: 80,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xffFFC5C5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (tournament.collection == 'mcq')
              Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/images/mcq.png")),
            if (tournament.collection == 'true_false')
              Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/images/trueFalse.jpg")),
            AppText(
              tournament.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
