import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        InkWell(
          onTap: onTap,
          child: AppText(
            "See All",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    );
  }
}
