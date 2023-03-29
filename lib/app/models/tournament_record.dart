// To parse this JSON data, do
//
//     final tournamentRecord = tournamentRecordFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TournamentRecord tournamentRecordFromJson(String str) =>
    TournamentRecord.fromJson(json.decode(str));

String tournamentRecordToJson(TournamentRecord data) =>
    json.encode(data.toJson());

class TournamentRecord {
  TournamentRecord({
    required this.leaderboardId,
    required this.ownerId,
    required this.username,
    required this.score,
    required this.numScore,
    required this.metadata,
    required this.createTime,
    required this.updateTime,
    required this.expiryTime,
    required this.rank,
    required this.maxNumScore,
  });

  String leaderboardId;
  String ownerId;
  String username;
  int score;
  int numScore;
  Map<String, dynamic> metadata;
  DateTime createTime;
  DateTime updateTime;
  DateTime expiryTime;
  int rank;
  int maxNumScore;

  factory TournamentRecord.fromJson(Map<String, dynamic> json) =>
      TournamentRecord(
        leaderboardId: json["leaderboard_id"],
        ownerId: json["owner_id"],
        username: json["username"],
        score: json["score"],
        numScore: json["num_score"],
        metadata: json["metadata"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
        expiryTime: DateTime.parse(json["expiry_time"]),
        rank: json["rank"],
        maxNumScore: json["max_num_score"],
      );

  Map<String, dynamic> toJson() => {
        "leaderboard_id": leaderboardId,
        "owner_id": ownerId,
        "username": username,
        "score": score,
        "num_score": numScore,
        "metadata": metadata,
        "create_time": createTime.toIso8601String(),
        "update_time": updateTime.toIso8601String(),
        "expiry_time": expiryTime.toIso8601String(),
        "rank": rank,
        "max_num_score": maxNumScore,
      };
}
