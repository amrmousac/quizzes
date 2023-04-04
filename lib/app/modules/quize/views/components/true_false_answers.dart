import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class TrueFalseAnswers extends StatefulWidget {
  const TrueFalseAnswers({super.key, required this.controller});
  final QuizeController controller;

  @override
  State<TrueFalseAnswers> createState() => _TrueFalseAnswersState();
}

class _TrueFalseAnswersState extends State<TrueFalseAnswers> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade700,
                border: Border.all(color: Colors.cyan, width: 3),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                //
                onTap: () {
                  widget.controller.checkTrueFalse(true, context);
                  if (widget.controller.isCurrentAnswerCorrect.value == true) {
                    visible = true;

                    Future.delayed(Duration(seconds: 2), () {
                      widget.controller.upateConfettieAnimation(false);
                      setState(() {
                        visible = false;
                      });
                    });
                  } else {}
                },
              ),
            ),
            SizedBox(
              width: 64.0,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                border: Border.all(color: Colors.cyan, width: 3),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onTap: () {
                  widget.controller.checkTrueFalse(false, context);
                  if (widget.controller.isCurrentAnswerCorrect.value == true) {
                    visible = true;

                    Future.delayed(Duration(seconds: 2), () {
                      widget.controller.upateConfettieAnimation(false);
                      setState(() {
                        visible = false;
                      });
                    });
                  } else {}
                },
              ),
            ),
          ],
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
