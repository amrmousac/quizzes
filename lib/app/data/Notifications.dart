import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/notifications.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_questions.dart';
import 'package:quizzes/app/models/tournament_record.dart';

class NotificationsAPI {
  final Dio dio;

  NotificationsAPI(this.dio);

  Future<Notifications?> getAllNotifications() async {
    try {
      final response = await dio.get(
        "/notifications/getNotifications?limit=100",
      );
      return Notifications.fromJson(response.data);
    } catch (e) {
      print("error $e");
      return null;
    }
  }

  Future<void> deleteNotifications(String id) async {
    try {
      final response = await dio.delete(
        "notifications/deleteNotifications?ids=$id",
      );
    } catch (e) {
      print("error $e");
    }
  }
}
