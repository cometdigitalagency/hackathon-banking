import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constant_color.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.white,
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: SvgPicture.asset("assets/icons/user.svg"),
    );
  }
}
