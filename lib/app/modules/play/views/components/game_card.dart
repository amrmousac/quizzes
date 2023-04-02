import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.tournament});
  final Tournament tournament;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offNamed(Routes.QUIZE, arguments: tournament);
      },
      child: Card(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                ColorManager.primary,
                ColorManager.secondary,
              ],
            ),
          ),
          height: 250,
          // alignment:const Alignment(0, 0),
          child: Stack(
            children: [
              Lottie.asset("assets/images/99718-confetti-animation.json"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset("assets/prize.svg");
                  Expanded(
                      child: Lottie.asset("assets/images/championship.json")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tournament.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                          fontSize: 21),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
