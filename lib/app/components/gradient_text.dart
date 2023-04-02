import 'package:flutter/material.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(colors: [
        ColorManager.secondary,
        ColorManager.primary,
      ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: AppText(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
