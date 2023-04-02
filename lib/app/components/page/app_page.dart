import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/components/gradient_text.dart';
import 'package:quizzes/app/components/page/dashboard_drawer.dart';
import 'package:quizzes/app/components/page/user_info.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:quizzes/app/utils/resources/font_manager.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppPage extends StatelessWidget {
  AppPage({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isMobile = getValueForScreenType(
        context: context, mobile: true, desktop: false, tablet: false);

    return Scaffold(
      key: _scaffoldkey,
      drawer: const DashboardDrawer(),
      body: Row(
        children: [
          // if (!isMobile) const DashboardDrawer(),
          Expanded(
              child: Column(
            children: [
              UserInfo(scaffoldkey: _scaffoldkey),
              Expanded(
                child: child,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
