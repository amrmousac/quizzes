import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/modules/quize/controllers/quize_controller.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

class QuizWidget extends StatelessWidget {
  final QuizeController controller;
  const QuizWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue.shade400,
        Colors.blue.shade900,
      ])),
      child: Obx(
        () {
          if (controller.current.value == controller.questions.length) {
            controller.api.tournamentsAPI
                .writeRecord(controller.tournament!.id, controller.score.value);
            return Center(
              child: Text(
                "You got ${controller.score.value}/5, Your score will be submeted to ${controller.tournament!.title} tournament",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 56,
                    fontWeight: FontWeight.w800),
              ),
            );
          }
          final quiz = controller.questions[controller.current.value];

          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 64.0, vertical: 16.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          border: Border.all(color: Colors.cyan, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.current.value + 1}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => controller.reset(),
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(15),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.network(
                          quiz.imgurl,
                        ),
                        height: 200,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 16.0),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.cyan, width: 3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quiz.question,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                          onTap: () => controller.check(true, context),
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
                          onTap: () => controller.check(false, context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Text(
                      "Score: ${controller.score.value}/5",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
