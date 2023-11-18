import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_shy_banking/constants/constant_color.dart';

class PaymentContainerIcon extends StatelessWidget {
  const PaymentContainerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ConstantColors.mainGradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SvgPicture.asset("assets/icons/scanning.svg"),
    );
  }
}
