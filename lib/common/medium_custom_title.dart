import 'package:flutter/material.dart';

import '../constants/constant_font_size.dart';

class MeduimCustomTitle extends StatelessWidget {
  const MeduimCustomTitle({
    super.key,
    required this.title,
    this.titleColor,
  });

  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ConstantFontSize.meduimTitle,
        fontWeight: FontWeight.bold,
        color: titleColor,
      ),
    );
  }
}
