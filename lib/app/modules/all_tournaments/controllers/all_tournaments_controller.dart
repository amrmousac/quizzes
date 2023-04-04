import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class AllTournamentsController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final tournaments = Get.find<TournamentService>();
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tournaments.getTournaments();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
