// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../common/medium_title_text.dart';
import '../constants/constant_font_size.dart';
import '../utils/utils.dart';

class CustomContainerWithPayType extends StatelessWidget {
  const CustomContainerWithPayType({
    Key? key,
    required this.title,
    this.value,
    this.valueColor,
    required this.subfixTitle,
  }) : super(key: key);

  final String title;
  final num? value;
  final Color? valueColor;
  final String subfixTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: ConstantFontSize.smallTitle,
          ),
        ),
        MediumTitleText(
          title: value == null
              ? "XXXXXXX $subfixTitle"
              : "${Utils.getCurrency(value!)} $subfixTitle",
          titleColor: valueColor,
          isBold: true,
        ),
      ],
    );
  }
}
