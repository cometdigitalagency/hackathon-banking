part of super_shy_transaction_filter;

class ActiveCustomContainerFilter extends StatelessWidget {
  const ActiveCustomContainerFilter({
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
        gradient: LinearGradient(
          colors: ConstantColors.mainGradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        expenseType.title,
        style: const TextStyle(
          color: ConstantColors.white,
        ),
      ),
    );
  }
}
