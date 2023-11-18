import 'package:flutter/material.dart';

import '../constants/constant_font_size.dart';

class NormalTitleText extends StatelessWidget {
  const NormalTitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ConstantFontSize.smallTitle,
        fontFamily: "Phetsarath",
      ),
    );
  }
}
