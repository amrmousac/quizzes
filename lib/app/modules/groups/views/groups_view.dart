import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return ResponsiveGridList(
              desiredItemWidth: 600,
              minSpacing: 20,
              children: [
                "Group 1",
                "Group 2",
                "Group 3",
                "Group 4",
                "Group 5",
                "Group 6",
                "Group 7",
                "Group 8",
                "Group 9",
                "Group 10",
              ].map((i) {
                return Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.cyan,
                    ),
                    height: 100,
                    // alignment:const Alignment(0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      children: [
                       
                        Text(
                          i.toString(),
                          style: getLightStyle(
                              color: ColorManager.darkGrey, fontSize: 16),
                        ),
                        SizedBox(width:50),
                         Text(
                          i.toString(),
                          style: getLightStyle(
                              color: ColorManager.darkGrey, fontSize: 16),
                        ),
                         SizedBox(width:50),
                        Text(
                          i.toString(),
                          style: getLightStyle(
                              color: ColorManager.darkGrey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList());
        }),
      ),
    );
  }
}
