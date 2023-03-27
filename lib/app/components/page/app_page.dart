import 'package:flutter/material.dart';
import 'package:quizzes/app/components/gradient_text.dart';
import 'package:quizzes/app/components/page/dashboard_drawer.dart';
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
      drawer: isMobile ? const DashboardDrawer() : null,
      body: Row(
        children: [
          if (!isMobile) const DashboardDrawer(),
          Expanded(
              child: Column(
            children: [
              if (isMobile)
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldkey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    GradientText(
                      "Quizzes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ],
                ),
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
