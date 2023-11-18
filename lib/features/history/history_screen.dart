import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:super_shy_transaction_filter/super_shy_transaction_filter.dart';

import '../../common/common_appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: "ປະຫວັດທຸລະກຳ",
        action: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(
              "assets/icons/reload.svg",
            ),
          ),
        ],
      ),
      body: const SuperShyTransaction(),
    );
  }
}
