import 'package:flutter/material.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/routes/app_pages.dart';

import 'package:responsive_builder/responsive_builder.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double space = 16.0;
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).colorScheme.background,
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
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    )
                  : Container(),
            ],
          ),
          const Divider(),
          GoToPage(
            text: "Play",
            routeName: Routes.REGISTERATION,
          ),
          const SizedBox(
            height: space,
          ),
        ],
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
    this.textStyle,
    required this.routeName,
  }) : super(key: key);

  final String text;
  final String routeName;
  final Map<String, String> params;
  final Map<String, String> queryParams;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var isTabletOrLess = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      watch: true,
      desktop: false,
    );
    final theme = Theme.of(context);

    return TextButton(
      style: style,
      onPressed: () {
        if (isTabletOrLess) {
          Navigator.pop(context);
        }
      },
      child: AppText(
        text,
        style: textStyle,
      ),
    );
  }
}
