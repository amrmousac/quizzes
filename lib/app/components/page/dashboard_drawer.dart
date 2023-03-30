import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/components/gradient_text.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';

import 'package:responsive_builder/responsive_builder.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double space = 16.0;
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        constraints: BoxConstraints(
          maxWidth: 250,
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  getValueForScreenType<bool>(
                          context: context,
                          mobile: true,
                          tablet: false,
                          desktop: false)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        )
                      : Container(),
                  GradientText(
                    "Gamification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.s25,
                    ),
                  ),
                ],
              ),
              const Divider(),
              GoToPage(
                text: "Play",
                routeName: Routes.PLAY,
              ),
              const SizedBox(
                height: space,
              ),
              GoToPage(
                text: "My Tournaments",
                routeName: Routes.TOURNAMENTS,
              ),
              const SizedBox(
                height: space,
              ),
              GoToPage(
                text: "All Tournaments",
                routeName: Routes.ALL_TOURNAMENTS,
              ),
              const SizedBox(
                height: space,
              ),
              GoToPage(
                text: "Groups",
                routeName: Routes.GROUPS,
              ),
              const SizedBox(
                height: space,
              ),
              GoToPage(
                text: "Preferences",
                routeName: Routes.PROFILE,
              ),
              const SizedBox(
                height: space,
              ),
              Spacer(),
              GoToPage(
                text: "Logout",
                routeName: Routes.REGISTERATION,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoToPage extends StatelessWidget {
  const GoToPage({
    Key? key,
    required this.text,
    this.params = const <String, String>{},
    this.queryParams = const <String, String>{},
    this.style,
    required this.routeName,
  }) : super(key: key);

  final String text;
  final String routeName;
  final Map<String, String> params;
  final Map<String, String> queryParams;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final isSelected = Get.currentRoute == routeName;
    var isTabletOrLess = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      watch: true,
      desktop: false,
    );

    return TextButton(
      style: style,
      onPressed: () {
        if (isTabletOrLess) {
          Navigator.pop(context);
        }
        Get.offNamed(routeName);
      },
      child: AppText(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
