import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/singleGroup/views/components/user_card.dart';
import 'package:quizzes/app/modules/singleGroup/views/single_group_widget.dart';

import '../../../components/page/app_page.dart';
import '../controllers/single_group_controller.dart';

class SingleGroupView extends GetView<SingleGroupController> {
  const SingleGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final group = controller.group;

    return AppPage(child: Obx(
      () {
        controller.users.refresh();
        if (group == null) return Container();
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(group.group.avatarUrl, scale: 400),
                      ),
                      SizedBox(
                        width: 32.0,
                      ),
                      AppText(
                        group.group.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 56,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  AppText(
                    group.group.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  ...controller.users
                      .map((element) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: UserCard(user: element),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
