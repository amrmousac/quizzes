import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/services/tournament_services.dart';

class ProductDetatilsController extends GetxController {
  final api = Get.find<GamificationAPI>();
  final tournaments = Get.find<TournamentService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> submitOrder() async {
    for (var element in tournaments.pointsTournaments) {
      await api.tournamentsAPI.writeRecord(element.id, 1);
    }
  }

  Future<void> deleteScore(int score) async {
    for (var element in tournaments.pointsTournaments) {
      await api.tournamentsAPI.writeRecord(element.id, -score);
    }
    tournaments.score.value = "0";
  }
}
