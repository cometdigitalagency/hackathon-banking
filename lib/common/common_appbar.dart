import 'package:flutter/material.dart';
import 'package:super_shy_banking/constants/constant_font_size.dart';

import '../constants/constant_color.dart';

AppBar commonAppbar({
  String? title,
  List<Widget>? action,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: title == null
        ? null
        : Text(
            title,
            style: const TextStyle(
              fontSize: ConstantFontSize.appBarTitle,
            ),
          ),
    actions: action,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ConstantColors.mainGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  );
}
