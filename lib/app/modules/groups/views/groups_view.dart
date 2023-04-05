import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/groups/views/components/group_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          if (controller.groups.isEmpty) {
            return Center(
              child: Lottie.asset("assets/images/smile.json",
                  width: 1000, height: 1000),
            );
          }
          controller.groups.refresh();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: controller.groups.map((tournament) {
                    return groupCard(group: tournament);
                  }).toList()),
            ),
          );
        },
      ),
    );
  }
}
