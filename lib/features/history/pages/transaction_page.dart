// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_banking/constants/constant_color.dart';
import 'package:super_shy_banking/constants/constant_font_size.dart';
import 'package:super_shy_banking/enums/expense_type.dart';
import 'package:super_shy_banking/enums/transaction_type.dart';
import 'package:super_shy_banking/features/history/providers/filter_state_provider.dart';
import 'package:super_shy_banking/features/history/widgets/transaction_list_container.dart';
import 'package:super_shy_banking/utils/utils.dart';
import 'package:super_shy_banking/widgets/active_custom_container_filter.dart';
import 'package:super_shy_banking/widgets/icon_custom_container_filter.dart';
import 'package:super_shy_banking/widgets/income_container_icon.dart';

import '../../../common/medium_custom_title.dart';
import '../../../widgets/inactive_custom_container_filter.dart';
import '../../../widgets/payment_container_icon.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ConstantColors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ພະຈິກ 2023"),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      height: 18,
                      "assets/icons/calendar.svg",
                      color: ConstantColors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final currentFilter = ref.watch(filterStateProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        ExpenseType.values.length,
                        (index) {
                          final currentFilterType = ExpenseType.values[index];
                          return GestureDetector(
                            onTap: () {
                              ref.read(filterStateProvider.notifier).state =
                                  currentFilterType;
                            },
                            child: currentFilter == currentFilterType
                                ? ActiveCustomContainerFilter(
                                    expenseType: currentFilterType,
                                  )
                                : InactiveCustomContainerFilter(
                                    expenseType: currentFilterType,
                                  ),
                          );
                        },
                      ),
                      IconCustomContainerFilter(
                        icon: SvgPicture.asset("assets/icons/filter.svg"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemBuilder: (context, index) => TransactionListContainerItem(
              transactionType: TransactionType.imcome,
              headerTitle: "ໄດ້ຮັບເງິນ",
              dateTimeText:
                  Utils.formatDateTimeInTransactionList(DateTime.now()),
              amount: Utils.getCurrency(25000),
            ),
            separatorBuilder: (context, _) => const SizedBox(height: 6),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
