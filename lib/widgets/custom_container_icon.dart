import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon({
    super.key,
    this.color = ConstantColors.grey,
    required this.icon,
  });
  final Color? color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          colors: ConstantColors.mainGradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: icon,
    );
  }
}
