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
      {super.key, required this.tournament, required this.controller});
  final Tournament tournament;
  final AllTournamentsController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isJoined = controller.myTournamentsIds.contains(tournament.id);

      return Card(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade400,
                Colors.blue.shade900,
              ],
            ),
          ),
          height: 250,
          // alignment:const Alignment(0, 0),
          child: Stack(
            children: [
              Lottie.asset("assets/images/99718-confetti-animation.json"),
              Align(
                alignment: Alignment.center,
                child: Column(
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
                            controller.getTournaments();
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
                            controller.getTournaments();
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
            ],
          ),
        ),
      );
    });
    ;
  }
}
