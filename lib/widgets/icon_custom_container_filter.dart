import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class IconCustomContainerFilter extends StatelessWidget {
  const IconCustomContainerFilter({
    super.key,
    required this.icon,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8.5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: icon,
    );
  }
}
