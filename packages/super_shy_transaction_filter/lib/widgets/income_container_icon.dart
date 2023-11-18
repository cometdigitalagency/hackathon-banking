part of super_shy_transaction_filter;

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
