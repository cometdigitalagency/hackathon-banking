// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:super_shy_banking/constants/constant_font_size.dart';

import '../constants/constant_color.dart';

class LargeTitleText extends StatelessWidget {
  const LargeTitleText({Key? key, required this.title, this.titleColor})
      : super(key: key);

  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: titleColor ?? ConstantColors.grey,
        fontSize: ConstantFontSize.largeTitle,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
