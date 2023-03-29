import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/all_tournaments/views/components/game_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../controllers/all_tournaments_controller.dart';

class AllTournamentsView extends GetView<AllTournamentsController> {
  const AllTournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          controller.myTournaments.refresh();
          return Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return ResponsiveGridList(
                  desiredItemWidth: 200,
                  minSpacing: 20,
                  children: controller.allTournaments.map((i) {
                    return JoinGameCard(
                      tournament: i,
                      controller: controller,
                    );
                  }).toList());
            }),
          );
        },
      ),
    );
    ;
  }
}
