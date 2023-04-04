import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/notifications_page/controllers/notifications_page_controller.dart';
import '../../../../models/notifications.dart' as notf;
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key, required this.notification, required this.controller});
  final notf.Notification notification;
  final NotificationsPageController controller;
  @override
  Widget build(BuildContext context) {
    final content = json.decode(notification.content);
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 4,
            color: Colors.grey.shade300,
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                notification.subject,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),
              InkWell(
                onTap: () {
                  controller.delete(notification.id);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ),
          AppText(
            content["message"],
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                DateFormat("yyyy/MM/DD hh:mm a")
                    .format(notification.createTime),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
