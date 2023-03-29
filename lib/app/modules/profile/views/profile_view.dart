import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/data/api.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Obx(
        () {
          final user = GamificationAPI.user.value;
          if (user == null) return Container();
          return Container(
            padding: EdgeInsets.all(8.0),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                AppText(
                  user.user.username,
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                _InfoItem(title: "Email", content: user.email),
                SizedBox(height: 8),
                _InfoItem(
                  title: "Location",
                  content: user.user.location ?? "",
                ),
                SizedBox(height: 8),
                _InfoItem(
                  title: "Language",
                  content: user.user.langTag ?? "",
                ),
              ],
            ),
          );
        },
      ),
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
