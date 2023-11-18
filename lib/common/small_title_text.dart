// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:super_shy_banking/constants/constant_font_size.dart';

import '../constants/constant_color.dart';

class SmallTitleText extends StatelessWidget {
  const SmallTitleText({
    Key? key,
    required this.title,
    this.isBold = false,
    this.color = ConstantColors.grey,
    this.textAlign = TextAlign.center,
    this.maxLine,
  }) : super(key: key);

  final String title;
  final bool isBold;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: isBold ? FontWeight.bold : null,
        fontSize: ConstantFontSize.meduimTitle,
      ),
    );
  }
}
