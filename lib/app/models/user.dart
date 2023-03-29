// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
    required this.wallet,
    required this.email,
  });

  UserData user;
  String wallet;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserData.fromJson(json["user"]),
        wallet: json["wallet"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "wallet": wallet,
        "email": email,
      };
}

class UserData {
  UserData({
    required this.id,
    required this.username,
    required this.langTag,
    required this.metadata,
    required this.createTime,
    required this.updateTime,
  });

  String id;
  String username;
  String langTag;
  String metadata;
  DateTime createTime;
  DateTime updateTime;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        langTag: json["lang_tag"],
        metadata: json["metadata"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "lang_tag": langTag,
        "metadata": metadata,
        "create_time": createTime.toIso8601String(),
        "update_time": updateTime.toIso8601String(),
      };
}
