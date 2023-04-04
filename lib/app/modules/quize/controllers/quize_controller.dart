import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_questions.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class QuizeController extends GetxController {
  final api = Get.find<GamificationAPI>();
  var tournament = Get.arguments as Tournament?;

  final tournamentQuize = Rx<TournamentQuestions?>(null);
  final current = 0.obs;
  final score = 0.obs;
  var isCurrentAnswerCorrect = false.obs;
  var showConfettie = false.obs;

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
      // showMyDialogRight(ctx);
      final snackbar = SnackBar(
        content: Row(
          children: [
            Image.asset(
              "assets/images/like.png",
              width: 70,
              height: 70,
            ),
            Spacer(),
            Text('Correct Answer'),
          ],
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
      isCurrentAnswerCorrect.value = true;
      showConfettie.value = true;
      update();
    } else {
      final snackbar = SnackBar(
        content: Row(
          children: [
            Image.asset(
              "assets/images/sad.jpg",
              width: 70,
              height: 70,
            ),
            Spacer(),
            Text('Wrong Answer'),
          ],
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Color.fromARGB(255, 237, 159, 147),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
      isCurrentAnswerCorrect.value = false;
      showConfettie.value = false;
      update();
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
      // showMyDialogRight(ctx);

      final snackbar = SnackBar(
        content: Row(
          children: [
            Image.asset(
              "assets/images/like.png",
              width: 70,
              height: 70,
            ),
            Spacer(),
            Text('Correct Answer'),
          ],
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      isCurrentAnswerCorrect.value = true;
      showConfettie.value = true;
      update();
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Row(
          children: [
            Image.asset(
              "assets/images/sad.jpg",
              width: 70,
              height: 70,
            ),
            Spacer(),
            Text('Wrong Answer'),
          ],
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Color.fromARGB(255, 237, 159, 147),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
      isCurrentAnswerCorrect.value = false;
      showConfettie.value = false;
      update();
    }
    if (current.value <
        (tournamentQuize.value?.questions.questions.length ?? 0)) {
      current.value++;
    }
  }

  void reset() {
    isCurrentAnswerCorrect.value = false;
    showConfettie.value = false;
    update();
    current.value = 0;
    score.value = 0;
  }

  void upateConfettieAnimation(bool x) {
    showConfettie.value = x;
    isCurrentAnswerCorrect.value = x;
    update();
  }

  Future<void> showMyDialogRight(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset(
                "assets/images/smile.png",
                width: 70,
                height: 70,
              ),
              Text(
                'Congratulations!!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
              // child: ListBody(
              //   children: const <Widget>[
              //     Center(child: Text('You got rewarded with a meal!')),
              //   ],
              // ),
              ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Quiz {
  final String question;
  final String imgurl;
  final bool answer;

  Quiz(this.question, this.imgurl, this.answer);
}
