import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament.dart';

class PlayGameCard extends StatelessWidget {
  const PlayGameCard({super.key, required this.tournament});
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 80,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffFFC5C5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/bike.png"),
          AppText(
            tournament.title,
          ),
        ],
      ),
    );
  }
}
