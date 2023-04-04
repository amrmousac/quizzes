import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class GameEnd extends StatelessWidget {
  const GameEnd({super.key, required this.controller});
  final QuizeController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child:  Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/smile.png")),),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "You got (${controller.score.value}), Your score will be submitted to ${controller.tournament!.title} tournament",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow, fontSize: 45, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),

        Center(
            child: SizedBox(
                height: 200,
                child: Lottie.asset(
                    "assets/images/99718-confetti-animation.json")),
          )
      ],
    );
  }
}
