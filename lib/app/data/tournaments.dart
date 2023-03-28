import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class TournamentsAPI {
  final Dio dio;

  TournamentsAPI(this.dio);

  Future<List<Tournament>> getUserTournaments() async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await dio.get("tournament/tournaments",
            queryParameters: {"userId": GamificationAPI.user.value?.user.id});

        final lst = (response.data["data"]["tournaments"] as List)
            .map((e) => Tournament.fromJson(e))
            .toList();
        return lst;
      }
      return <Tournament>[];
    } on DioError catch (e) {
      print("error $e");
      return <Tournament>[];
    } catch (e) {
      return <Tournament>[];
    }
  }
}
