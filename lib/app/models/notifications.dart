// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    required this.notifications,
  });

  List<Notification> notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    required this.id,
    required this.subject,
    required this.content,
    required this.code,
    required this.createTime,
    required this.persistent,
  });

  String id;
  String subject;
  String content;
  int code;
  DateTime createTime;
  bool persistent;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        subject: json["subject"],
        content: json["content"],
        code: json["code"],
        createTime: DateTime.parse(json["create_time"]),
        persistent: json["persistent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "content": content,
        "code": code,
        "create_time": createTime.toIso8601String(),
        "persistent": persistent,
      };
}
