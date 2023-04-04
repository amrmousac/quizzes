import 'package:flutter/material.dart';

import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class GameEnd extends StatelessWidget {
  const GameEnd({super.key, required this.controller});
  final QuizeController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "You got ${controller.score.value}/5, Your score will be submitted to ${controller.tournament!.title} tournament",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.yellow, fontSize: 56, fontWeight: FontWeight.w800),
      ),
    );
  }
}
