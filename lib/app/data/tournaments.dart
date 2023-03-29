import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';

class TournamentsAPI {
  final Dio dio;

  TournamentsAPI(this.dio);

  Future<List<Tournament>> getUserTournaments(
      String username, String email, String password) async {
    try {
      return <Tournament>[];
    } on DioError catch (e) {
      print("error $e");
      return <Tournament>[];
    } catch (e) {
      return <Tournament>[];
    }
  }
}
