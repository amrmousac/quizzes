// To parse this JSON data, do
//
//     final groupUser = groupUserFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GroupUser groupUserFromJson(String str) => GroupUser.fromJson(json.decode(str));

String groupUserToJson(GroupUser data) => json.encode(data.toJson());

class GroupUser {
  GroupUser({
    required this.user,
    required this.state,
  });

  User user;
  int state;

  factory GroupUser.fromJson(Map<String, dynamic> json) => GroupUser(
        user: User.fromJson(json["user"]),
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "state": state,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.langTag,
    required this.location,
    required this.metadata,
    required this.createTime,
    required this.updateTime,
  });

  String id;
  String username;
  String? langTag;
  String? location;
  String? metadata;
  DateTime? createTime;
  DateTime? updateTime;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        langTag: json["lang_tag"],
        location: json["location"],
        metadata: json["metadata"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "lang_tag": langTag,
        "location": location,
        "metadata": metadata,
        "create_time": createTime?.toIso8601String(),
        "update_time": updateTime?.toIso8601String(),
      };
}
