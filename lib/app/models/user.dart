// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
    required this.wallet,
    required this.email,
  });

  UserClass user;
  String wallet;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        wallet: json["wallet"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "wallet": wallet,
        "email": email,
      };
}

class UserClass {
  UserClass({
    required this.id,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.langTag,
    required this.location,
    required this.timezone,
    required this.metadata,
    required this.createTime,
    required this.updateTime,
  });

  String id;
  String username;
  String? displayName;
  String? avatarUrl;
  String? langTag;
  String? location;
  String? timezone;
  String? metadata;
  DateTime createTime;
  DateTime updateTime;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        username: json["username"],
        displayName: json["display_name"],
        avatarUrl: json["avatar_url"],
        langTag: json["lang_tag"],
        location: json["location"],
        timezone: json["timezone"],
        metadata: json["metadata"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "display_name": displayName,
        "avatar_url": avatarUrl,
        "lang_tag": langTag,
        "location": location,
        "timezone": timezone,
        "metadata": metadata,
        "create_time": createTime.toIso8601String(),
        "update_time": updateTime.toIso8601String(),
      };
}
