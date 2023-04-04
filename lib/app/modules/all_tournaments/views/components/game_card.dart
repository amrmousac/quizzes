import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/modules/all_tournaments/controllers/all_tournaments_controller.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';

class JoinGameCard extends StatelessWidget {
  const JoinGameCard(
      {super.key,
      required this.tournament,
      required this.controller,
      required this.color});
  final Tournament tournament;
  final AllTournamentsController controller;
  final List<Color> color;
  @override
  Widget build(BuildContext context) {
    bool isJoined =
        controller.tournaments.myTournamentsIds.contains(tournament.id);
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: color,
          ),
        ),
        height: 100,
        width: double.infinity,
        // alignment:const Alignment(0, 0),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset("assets/prize.svg");
              // Lottie.asset("assets/images/99718-confetti-animation.json"),

              Lottie.asset("assets/images/championship.json"),

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
              Spacer(),
              if (isJoined)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.red,
                      ),
                    ),
                    onPressed: () async {
                      await controller.api.tournamentsAPI
                          .leaveTournament(tournament.id);
                      controller.tournaments.getTournaments();
                    },
                    child: AppText(
                      'Leave',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              if (!isJoined)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber)),
                    onPressed: () async {
                      await controller.api.tournamentsAPI
                          .joinTournament(tournament.id);
                      controller.tournaments.getTournaments();
                    },
                    child: AppText(
                      'Join',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
