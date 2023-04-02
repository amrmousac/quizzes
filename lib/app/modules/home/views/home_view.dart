import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/modules/home/views/components/section_header.dart';
import '../../../components/page/app_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Padding(
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
                SectionHeader(title: "Games"),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                      3, (index) => Image.asset("assets/images/game_icon.png")),
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
                      (index) =>
                          Image.asset("assets/images/frame${index + 1}.png")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
