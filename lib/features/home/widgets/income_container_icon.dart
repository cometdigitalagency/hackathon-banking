import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constant_color.dart';

class IncomeContainerIcon extends StatelessWidget {
  const IncomeContainerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ConstantColors.sucess,
        borderRadius: BorderRadius.circular(6),
      ),
      child: SvgPicture.asset("assets/icons/income_arrow.svg"),
    );
  }
}
