import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/quize/views/components/game_end.dart';
import 'package:quizzes/app/modules/quize/views/components/mcq_answers.dart';
import 'package:quizzes/app/modules/quize/views/components/true_false_answers.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

import '../controllers/quize_controller.dart';

class QuizeView extends GetView<QuizeController> {
  const QuizeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 237, 159, 147),
            ColorManager.secondary,
          ]),
        ),
        child: Obx(
          () {
            final quiz = controller.tournamentQuize.value;
            if (quiz == null) {
              return Container();
            }
            if (controller.current.value == quiz.questions.questions.length) {
              controller.api.tournamentsAPI.writeRecord(
                  controller.tournament!.id, controller.score.value);
              return GameEnd(controller: controller);
            }
            final question = quiz.questions.questions[controller.current.value];

            return SingleChildScrollView(
              child: IntrinsicHeight(
                child: Container(
                  constraints: BoxConstraints(minHeight: Get.height),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
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
                          Expanded(
                            child: Tooltip(
                              message: controller.tournament?.title ?? "",
                              child: AppText(
                                controller.tournament?.title ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          //  Spacer(),
                          ElevatedButton(
                            child: Text(
                              'view Rank',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.RANKING,
                                  arguments: controller.tournament);
                            },
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
                      Spacer(),
                      if (question.image != null ||
                          question.image != "undefined")
                        Container(
                          margin: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          height: 200,
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  question.image!,
                                )),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      SizedBox(
                        height: 16.0,
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
                                question.question,
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
                        height: 64,
                      ),
                      if (controller.tournament?.collection == "true_false")
                        TrueFalseAnswers(controller: controller),
                      if (controller.tournament?.collection == "mcq")
                        McqAnswers(
                            controller: controller,
                            answers: controller
                                    .tournamentQuize
                                    .value
                                    ?.questions
                                    .questions[controller.current.value]
                                    .answers ??
                                []),
                      SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Text(
                          "Score: ${controller.score.value}",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
