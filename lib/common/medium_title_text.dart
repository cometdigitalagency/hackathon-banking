import 'package:flutter/material.dart';
import 'package:super_shy_banking/constants/constant_font_size.dart';

import '../constants/constant_color.dart';

class MediumTitleText extends StatelessWidget {
  const MediumTitleText({
    Key? key,
    required this.title,
    this.titleColor,
    this.isBold = false,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ConstantFontSize.meduimTitle,
        color: titleColor ?? ConstantColors.grey,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}
