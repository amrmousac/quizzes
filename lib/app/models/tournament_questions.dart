// To parse this JSON data, do
//
//     final tournamentQuestions = tournamentQuestionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TournamentQuestions tournamentQuestionsFromJson(String str) =>
    TournamentQuestions.fromJson(json.decode(str));

String tournamentQuestionsToJson(TournamentQuestions data) =>
    json.encode(data.toJson());

class TournamentQuestions {
  TournamentQuestions({
    required this.tournamentType,
    required this.questions,
  });

  String tournamentType;
  Questions questions;

  factory TournamentQuestions.fromJson(Map<String, dynamic> json) =>
      TournamentQuestions(
        tournamentType: json["tournamentType"],
        questions: Questions.fromJson(json["questions"]),
      );

  Map<String, dynamic> toJson() => {
        "tournamentType": tournamentType,
        "questions": questions.toJson(),
      };
}

class Questions {
  Questions({
    required this.questions,
  });

  List<Question> questions;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.answer,
    required this.question,
    required this.trueNum,
    required this.answers,
  });

  bool? answer;
  String question;
  int? trueNum;
  List<Answer>? answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        answer: json["answer"],
        question: json["question"],
        trueNum: json["trueNum"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "question": question,
        "trueNum": trueNum,
        "answers": List<Answer>.from(answers?.map((x) => x.toJson()) ?? []),
      };
}

class Answer {
  Answer({
    required this.no,
    required this.value,
  });

  int no;
  String value;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        no: json["no"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "value": value,
      };
}
