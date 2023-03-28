// To parse this JSON data, do
//
//     final tournament = tournamentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Tournament tournamentFromJson(String str) =>
    Tournament.fromJson(json.decode(str));

String tournamentToJson(Tournament data) => json.encode(data.toJson());

class Tournament {
  Tournament({
    required this.nextReset,
    required this.metadata,
    required this.endTime,
    required this.tournamentOperator,
    required this.description,
    required this.maxSize,
    required this.size,
    required this.title,
    required this.sortOrder,
    required this.prevReset,
    required this.startTime,
    required this.id,
    required this.maxNumScore,
    required this.duration,
    required this.startActive,
    required this.endActive,
    required this.canEnter,
    required this.createTime,
    required this.category,
  });

  int nextReset;
  Metadata metadata;
  int? endTime;
  String tournamentOperator;
  String description;
  int maxSize;
  int size;
  String title;
  int? sortOrder;
  int? prevReset;
  int startTime;
  String id;
  int maxNumScore;
  int duration;
  int startActive;
  int endActive;
  bool canEnter;
  int createTime;
  int category;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        nextReset: json["nextReset"],
        metadata: Metadata.fromJson(json["metadata"]),
        endTime: json["endTime"],
        tournamentOperator: json["operator"],
        description: json["description"],
        maxSize: json["maxSize"],
        size: json["size"],
        title: json["title"],
        sortOrder: json["sortOrder"],
        prevReset: json["prevReset"],
        startTime: json["startTime"],
        id: json["id"],
        maxNumScore: json["maxNumScore"],
        duration: json["duration"],
        startActive: json["startActive"],
        endActive: json["endActive"],
        canEnter: json["canEnter"],
        createTime: json["createTime"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "nextReset": nextReset,
        "metadata": metadata.toJson(),
        "endTime": endTime,
        "operator": tournamentOperator,
        "description": description,
        "maxSize": maxSize,
        "size": size,
        "title": title,
        "sortOrder": sortOrder,
        "prevReset": prevReset,
        "startTime": startTime,
        "id": id,
        "maxNumScore": maxNumScore,
        "duration": duration,
        "startActive": startActive,
        "endActive": endActive,
        "canEnter": canEnter,
        "createTime": createTime,
        "category": category,
      };
}

class Metadata {
  Metadata({
    required this.weatherConditions,
  });

  String weatherConditions;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        weatherConditions: json["weatherConditions"],
      );

  Map<String, dynamic> toJson() => {
        "weatherConditions": weatherConditions,
      };
}
