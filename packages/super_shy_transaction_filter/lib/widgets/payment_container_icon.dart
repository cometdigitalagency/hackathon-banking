part of super_shy_transaction_filter;

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
