import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament_questions.dart';
import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class McqAnswers extends StatelessWidget {
  const McqAnswers(
      {super.key, required this.controller, required this.answers});
  final QuizeController controller;
  final List<Answer> answers;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: answers
          .map(
            (e) => InkWell(
              onTap: () {
                controller.checkMcq(e.no, context);
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: AppText("${e.no}: ${e.value}"),
              ),
            ),
          )
          .toList(),
    );
  }
}
