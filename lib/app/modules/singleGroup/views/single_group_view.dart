import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/modules/singleGroup/views/single_group_widget.dart';

import '../../../components/page/app_page.dart';
import '../controllers/single_group_controller.dart';

class SingleGroupView extends GetView<SingleGroupController> {
  const SingleGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppPage(child: Center(child: SingleGroupWidget(groupName: "Group Name",numOfGroup:"100")));
  }
}
