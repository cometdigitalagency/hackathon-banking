import 'package:flutter/material.dart';

import '../../../common/medium_title_text.dart';
import '../../../constants/constant_color.dart';
import '../../../constants/constant_font_size.dart';
import '../../../enums/transaction_type.dart';
import '../../../widgets/income_container_icon.dart';
import '../../../widgets/payment_container_icon.dart';

class TransactionListContainerItem extends StatelessWidget {
  const TransactionListContainerItem({
    super.key,
    required this.transactionType,
    required this.headerTitle,
    required this.dateTimeText,
    required this.amount,
  });

  final TransactionType transactionType;
  final String headerTitle;
  final String dateTimeText;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ConstantColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              transactionType == TransactionType.imcome
                  ? const IncomeContainerIcon()
                  : const PaymentContainerIcon(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediumTitleText(
                    title: headerTitle,
                    isBold: true,
                  ),
                  Text(
                    dateTimeText,
                    style: TextStyle(
                      fontSize: ConstantFontSize.smallTitle,
                      color: ConstantColors.grey.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          MediumTitleText(
            title: transactionType == TransactionType.imcome
                ? "+$amount LAK"
                : "-$amount LAK",
            titleColor: transactionType == TransactionType.imcome
                ? ConstantColors.sucess
                : ConstantColors.grey,
            isBold: true,
          ),
        ],
      ),
    );
  }
}
