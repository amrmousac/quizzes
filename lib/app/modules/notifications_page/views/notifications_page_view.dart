import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/modules/notifications_page/views/components/notification_card.dart';

import '../controllers/notifications_page_controller.dart';

class NotificationsPageView extends GetView<NotificationsPageController> {
  const NotificationsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          final notfis =
              controller.tournaments.notifications.value?.notifications;
          if (notfis == null) {
            return Container();
          }
          return SingleChildScrollView(
            child: IntrinsicHeight(
                child: Column(
              children: notfis
                  .map((data) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NotificationCard(
                          notification: data,
                          controller: controller,
                        ),
                      ))
                  .toList(),
            )),
          );
        },
      ),
    );
  }
}
