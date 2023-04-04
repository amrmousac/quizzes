import 'dart:math';

import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final api = Get.find<GamificationAPI>();
  final tournaments = Get.find<TournamentService>();

  final gameTournaments = <Tournament>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getGameTournament();
    tournaments.myTournaments.listen((p0) {
      getGameTournament();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getGameTournament() {
    gameTournaments.clear();

    for (var element in tournaments.myTournaments) {
      if (element.collection == "mcq" || element.collection == "true_false") {
        gameTournaments.add(element);
      }
    }
    gameTournaments.refresh();
  }
}
