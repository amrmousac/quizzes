import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.scaffoldkey});

  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final user = GamificationAPI.user.value;
        if (user == null) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //   onPressed: () {
              //     _scaffoldkey.currentState?.openDrawer();
              //   },
              //   icon: const Icon(Icons.menu),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Hi, ${user.user.displayName ?? user.user.username}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText(
                    "🏠 ${user.user.location ?? ""}",
                    style: TextStyle(),
                  ),
                ],
              ),

              InkWell(
                onTap: () {
                  scaffoldkey.currentState?.openDrawer();
                },
                child: Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.primary,
                        ColorManager.secondary,
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: user.user.avatarUrl == null
                        ? AssetImage("assets/images/user.webp") as ImageProvider
                        : NetworkImage(user.user.avatarUrl!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
