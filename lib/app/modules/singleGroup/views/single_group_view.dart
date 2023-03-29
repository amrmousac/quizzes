import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/models/group.dart';
import 'package:quizzes/app/modules/singleGroup/views/components/user_card.dart';
import 'package:quizzes/app/modules/singleGroup/views/single_group_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../components/page/app_page.dart';
import '../controllers/single_group_controller.dart';

class SingleGroupView extends GetView<SingleGroupController> {
  const SingleGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final group = controller.group;
    final isMobile =
        getValueForScreenType(context: context, mobile: true, desktop: false);
    return AppPage(child: Obx(
      () {
        controller.users.refresh();
        if (group == null) return Container();
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            group.group.avatarUrl ??
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                            scale: 400),
                      ),
                      SizedBox(
                        width: 16.0,
                        height: 16.0,
                      ),
                      isMobile
                          ? Desc(group: group)
                          : Expanded(
                              child: Desc(group: group),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  ...controller.users
                      .map((element) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: UserCard(user: element),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

class Desc extends StatelessWidget {
  const Desc({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          group.group.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 56,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        AppText(
          group.group.description,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: Colors.grey.shade600),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _InfoItem(title: "Language: ", content: "${group.group.langTag}"),
            _InfoItem(title: "Max Users: ", content: "${group.group.maxCount}"),
            _InfoItem(title: "Users: ", content: "${group.group.edgeCount}"),
          ],
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText("$title : "),
            AppText(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
