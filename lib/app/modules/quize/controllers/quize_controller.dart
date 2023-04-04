import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_questions.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class QuizeController extends GetxController {
  final api = Get.find<GamificationAPI>();
  var tournament = Get.arguments as Tournament?;

  // final questions = <Quiz>[
  //   Quiz(
  //       "1.Is this a laptop?",
  //       "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFwdG9wfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  //       true),
  //   Quiz(
  //       "2.Is this a Android phone?",
  //       "https://images.unsplash.com/photo-1586953208448-b95a79798f07?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBob25lfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  //       false),
  //   Quiz(
  //       "3.Is this bike RC200?",
  //       "https://images.unsplash.com/photo-1598209279122-8541213a0387?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmMyMDB8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  //       true),
  //   Quiz(
  //       "4.Is this car a Lambho?",
  //       "https://images.unsplash.com/photo-1516515429572-bf32372f2409?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGxhbWJvfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  //       true),
  //   Quiz(
  //       "5. Is this city is England?",
  //       "https://images.unsplash.com/photo-1569949380643-6e746ecaa3bd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHRvdXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  //       false),
  // ];
  final tournamentQuize = Rx<TournamentQuestions?>(null);
  final current = 0.obs;
  final score = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (tournament == null) {
      Get.offNamed(Routes.HOME);
    } else {
      getQuestions();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getQuestions() async {
    tournamentQuize.value =
        await api.tournamentsAPI.getTournamentAnswers(tournament!.id);
  }

  void checkTrueFalse(bool choice, BuildContext ctx) {
    if (choice ==
        tournamentQuize.value?.questions.questions[current.value].answer) {
      score.value++;
      final snackbar = SnackBar(
        content: Text('Correct Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text('Wrong Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    if (current.value <
        (tournamentQuize.value?.questions.questions.length ?? 0)) {
      current.value++;
    }
  }

  void checkMcq(int choice, BuildContext ctx) {
    if (choice ==
        tournamentQuize.value?.questions.questions[current.value].trueNum) {
      score.value++;
      final snackbar = SnackBar(
        content: Text('Correct Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text('Wrong Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    if (current.value <
        (tournamentQuize.value?.questions.questions.length ?? 0)) {
      current.value++;
    }
  }

  void reset() {
    current.value = 0;
    score.value = 0;
  }
}

class Quiz {
  final String question;
  final String imgurl;
  final bool answer;

  Quiz(this.question, this.imgurl, this.answer);
}
