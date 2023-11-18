import 'package:flutter/material.dart';
import 'package:super_shy_banking/enums/expense_type.dart';

import '../constants/constant_color.dart';

class InactiveCustomContainerFilter extends StatelessWidget {
  const InactiveCustomContainerFilter({
    super.key,
    required this.expenseType,
  });

  final ExpenseType expenseType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        expenseType.title,
        style: const TextStyle(
          color: ConstantColors.grey,
        ),
      ),
    );
  }
}
