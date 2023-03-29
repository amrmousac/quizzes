// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
  Group({
    required this.group,
    required this.state,
  });

  GroupData group;
  int state;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        group: GroupData.fromJson(json["group"]),
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "group": group.toJson(),
        "state": state,
      };
}

class GroupData {
  GroupData({
    required this.id,
    required this.creatorId,
    required this.name,
    required this.description,
    required this.langTag,
    required this.metadata,
    required this.avatarUrl,
    required this.open,
    required this.edgeCount,
    required this.maxCount,
    required this.createTime,
    required this.updateTime,
  });

  String id;
  String creatorId;
  String name;
  String description;
  String langTag;
  Map<String, dynamic> metadata;
  String avatarUrl;
  bool open;
  int edgeCount;
  int maxCount;
  DateTime createTime;
  DateTime updateTime;

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
        id: json["id"],
        creatorId: json["creator_id"],
        name: json["name"],
        description: json["description"],
        langTag: json["lang_tag"],
        metadata: jsonDecode(json["metadata"]),
        avatarUrl: json["avatar_url"],
        open: json["open"],
        edgeCount: json["edge_count"],
        maxCount: json["max_count"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "creator_id": creatorId,
        "name": name,
        "description": description,
        "lang_tag": langTag,
        "metadata": metadata,
        "avatar_url": avatarUrl,
        "open": open,
        "edge_count": edgeCount,
        "max_count": maxCount,
        "create_time": createTime.toIso8601String(),
        "update_time": updateTime.toIso8601String(),
      };
}
