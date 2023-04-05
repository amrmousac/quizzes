import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/home/views/components/game_card.dart';
import 'package:quizzes/app/modules/home/views/components/section_header.dart';
import 'package:quizzes/app/modules/play/views/components/game_card.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import '../../../components/page/app_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          controller.tournaments.myTournamentsIds.refresh();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset("assets/images/panner.png"),
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    if (controller.gameTournaments.length == 0)
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ALL_TOURNAMENTS);
                        },
                        child: AppText(
                          "See all Tournament",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.gameTournaments.length != 0)
                      SectionHeader(
                        title: "Games",
                        onTap: () {
                          Get.toNamed(Routes.ALL_TOURNAMENTS);
                        },
                      ),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: controller.gameTournaments
                          .map(
                            (element) => PlayGameCard(tournament: element),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SectionHeader(title: "Explore"),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                        6,
                        (index) => InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PRODUCT_DETATILS);
                          },
                          child: Image.asset(
                            "assets/images/frame${index + 1}.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
