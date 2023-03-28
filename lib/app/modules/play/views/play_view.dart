import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/modules/play/views/components/game_card.dart';
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
      child: Obx(
        () {
          controller.tournaments.refresh();
          return Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return ResponsiveGridList(
                  desiredItemWidth: 200,
                  minSpacing: 20,
                  children: controller.tournaments.map((i) {
                    return GameCard(
                      tournament: i,
                    );
                  }).toList());
            }),
          );
        },
      ),
    );
  }
}
