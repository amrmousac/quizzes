import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/tournaments/views/components/tournament_card.dart';
import '../controllers/tournaments_controller.dart';

class TournamentsView extends GetView<TournamentsController> {
  const TournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          if (controller.tournaments.myTournaments.isEmpty) {
            return Center(
              child: Lottie.asset("assets/images/Athlete.json"),
            );
          }
          controller.tournaments.myTournaments.refresh();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children:
                      controller.tournaments.myTournaments.map((tournament) {
                    return TournamentCard(tournament: tournament);
                  }).toList()),
            ),
          );
        },
      ),
    );
  }
}
