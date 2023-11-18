import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_shy_banking/constants/constant_color.dart';
import 'package:super_shy_banking/features/history/pages/statistic_page.dart';
import 'package:super_shy_banking/features/history/pages/transaction_page.dart';

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
      body: const DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: ConstantColors.primary,
              unselectedLabelColor: ConstantColors.grey,
              labelColor: ConstantColors.primary,
              tabs: <Widget>[
                Tab(
                  icon: Text("ການເຄື່ອນໄຫວ"),
                ),
                Tab(
                  icon: Text("ສະຖິຕິ"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TransactionPage(),
                  StatisticPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
