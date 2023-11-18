import 'package:flutter/material.dart';

import 'package:super_shy_transaction_filter/super_shy_transaction_filter.dart';

import '../../common/common_appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: "ປະຫວັດທຸລະກຳ",
      ),
      body: SuperShyTransaction(
        superShyTransactionList: [
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now().subtract(const Duration(days: 20)),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now().subtract(const Duration(days: 10)),
            suffixTitle: "LAK",
            category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 300000,
            isIncome: true,
            date: DateTime.now().subtract(const Duration(days: 10)),
            suffixTitle: "LAK",
            category: "ສຸຂະພາບ",
          ),
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now().subtract(const Duration(days: 1)),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
        ],
      ),
    );
  }
}
