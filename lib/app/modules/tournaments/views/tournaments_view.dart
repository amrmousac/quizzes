import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/tournaments/controllers/components/tournament_card.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../utils/resources/color_manager.dart';
import '../controllers/tournaments_controller.dart';

class TournamentsView extends GetView<TournamentsController> {
  const TournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.tournaments.refresh();
        return AppPage(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: controller.tournaments.map((tournament) {
                    return TournamentCard(tournament: tournament);
                  }).toList()),
            ),
          ),
        );
      },
    );
  }
}
