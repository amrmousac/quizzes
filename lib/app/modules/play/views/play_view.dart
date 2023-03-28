import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/styles_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../../routes/app_pages.dart';
import '../controllers/play_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = getValueForScreenType<bool>(
      context: context,
      mobile: false,
      tablet: false,
      desktop: true,
    );
    return AppPage(
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return ResponsiveGridList(
              desiredItemWidth: 200,
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
                return InkWell(
                  onTap: (){
                     Get.toNamed(Routes.QUIZE);
                  },
                  child: Card(
                  
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.cyan,
                      ),
                      height: 250,
                      // alignment:const Alignment(0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              // SvgPicture.asset("assets/prize.svg");
                              Center(
                                  child: SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Lottie.asset(
                                          "assets/images/championship.json"))),
                              Lottie.asset(
                                  "assets/images/99718-confetti-animation.json"),
                            ],
                          ),
                          Text(
                            i.toString(),
                            style: getLightStyle(
                                color: ColorManager.darkGrey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList());
        }),
      ),
    );
  }
}
