import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/tournament.dart';
import 'package:quizzes/app/models/tournament_record.dart';

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

  Future<List<Tournament>> getAllTournaments() async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await dio.get(
          "tournament/all",
        );
        final lst = (response.data["tournaments"] as List)
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

  Future<bool> joinTournament(String tournamentId) async {
    try {
      final response = await dio.post(
        "/tournament/join",
        queryParameters: {
          "tournamentId": tournamentId,
        },
      );
      print(response.data);
      return true;
    } catch (e) {
      print("error $e");
      return false;
    }
  }

  Future<TournamentRecord?> writeRecord(String tournamentId, int score) async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await dio.post("tournament/record", queryParameters: {
          "tournamentId": tournamentId
        }, data: {
          "owner": GamificationAPI.user.value?.user.id,
          "score": score
        });

        return TournamentRecord.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      print("error $e");
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<TournamentRecord>> getTournamentRecords(
    String tournamentId,
  ) async {
    try {
      final response = await dio.get(
        "tournament/records",
        queryParameters: {"tournamentId": tournamentId},
      );

      final lst = (response.data["records"] as List)
          .map((e) => TournamentRecord.fromJson(e))
          .toList();
      return lst;
    } on DioError catch (e) {
      print("error $e");
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<TournamentRecord>> getTournamentRecordsAroundUser(
    Tournament tournament,
  ) async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await dio.get(
          "tournament/owner",
          queryParameters: {
            "tournamentId": tournament.id,
            "ownerId": GamificationAPI.user.value?.user.id,
            "limit": 100,
          },
        );
        final lst = (response.data["records"] as List)
            .map((e) => TournamentRecord.fromJson(e))
            .toList();
        return lst;
      }
      return [];
    } on DioError catch (e) {
      print("error $e");
      return [];
    } catch (e) {
      return [];
    }
  }
}
