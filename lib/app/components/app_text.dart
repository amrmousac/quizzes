import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    Key? key,
    this.textAlign,
    this.maxLines,
    this.isSelectable = false,
    this.style,
    this.overflow,
    this.textDirection,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isSelectable;
  final TextStyle? style;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return isSelectable
        ? SelectableText(
            text,
            showCursor: true,
            textAlign: textAlign,
            maxLines: maxLines,
            style: style,
            textDirection: textDirection,
          )
        : Text(
            text,
            textAlign: textAlign,
            maxLines: maxLines,
            style: style,
            overflow: overflow,
            textDirection: textDirection,
          );
  }
}
