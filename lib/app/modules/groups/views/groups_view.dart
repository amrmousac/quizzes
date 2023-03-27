import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: const Center(
        child: Text(
          'GroupsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
