import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../utils/resources/color_manager.dart';
import '../controllers/tournaments_controller.dart';

class TournamentsView extends GetView<TournamentsController> {
  const TournamentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return ResponsiveGridList(
              desiredItemWidth: 600,
              minSpacing: 20,
              children: [
                "Tournament 1",
                "Tournament 2",
                "Tournament 3",
                "Tournament 4",
                "Tournament 5",
                "Tournament 6",
                "Tournament 7",
                "Tournament 8",
                "Tournament 9",
                "Tournament 10",
                "Tournament 11",
                "Tournament 12",
                "Tournament 13",
                "Tournament 14",
                "Tournament 15",
                "Tournament 16",
                "Tournament 17",
                "Tournament 18",
                "Tournament 19",
                "Tournament 20",
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
