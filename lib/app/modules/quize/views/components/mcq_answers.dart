import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament_questions.dart';
import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class McqAnswers extends StatefulWidget {
  const McqAnswers(
      {super.key, required this.controller, required this.answers});
  final QuizeController controller;
  final List<Answer> answers;

  @override
  State<McqAnswers> createState() => _McqAnswersState();
}

class _McqAnswersState extends State<McqAnswers> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.answers
              .map(
                (e) => InkWell(
                  onTap: () {
                    widget.controller.checkMcq(e.no, context);
                    if (widget.controller.isCurrentAnswerCorrect.value ==
                        true) {
                      visible = true;

                      Future.delayed(Duration(seconds: 2), () {
                        widget.controller.upateConfettieAnimation(false);
                        setState(() {
                          visible = false;
                        });
                      });
                    } else {}
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 200,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: AppText("${e.no}: ${e.value}"),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Visibility(
          visible: visible,
          child: Center(
            child: SizedBox(
                height: 200,
                child: Lottie.asset(
                    "assets/images/99718-confetti-animation.json")),
          ),
        )
      ],
    );
  }
}
