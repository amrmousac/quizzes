import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/all_tournaments/views/components/game_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../routes/app_pages.dart';
import '../controllers/all_tournaments_controller.dart';

class AllTournamentsView extends GetView<AllTournamentsController> {
  const AllTournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          if (controller.tournaments.allTournaments.isEmpty) {
            return Center(
              child: Lottie.asset("assets/images/Athlete.json"),
            );
          }
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text(
                      'joined tournaments',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      controller.pageController.animateToPage(0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Available tournaments',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      controller.pageController.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView(
              controller: controller.pageController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...controller.tournaments.myTournaments.map((i) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.RANKING, arguments: i);
                          },
                          child: JoinGameCard(
                            tournament: i,
                            controller: controller,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...controller.tournaments.allTournaments.map((i) {
                        return JoinGameCard(
                          tournament: i,
                          controller: controller,
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ))
          ]);
        },
      ),
    );
    ;
  }
}
