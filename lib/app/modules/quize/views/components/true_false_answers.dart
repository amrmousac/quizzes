import 'package:flutter/material.dart';
import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';

class TrueFalseAnswers extends StatelessWidget {
  const TrueFalseAnswers({super.key, required this.controller});
  final QuizeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            onTap: () => controller.checkTrueFalse(true, context),
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
            onTap: () => controller.checkTrueFalse(false, context),
          ),
        ),
      ],
    );
  }
}
