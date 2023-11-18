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
      body: SuperShyTransaction(
        superShyTransactionList: [
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
        ],
      ),
    );
  }
}
