part of super_shy_transaction_filter;

class MediumTitleText extends StatelessWidget {
  const MediumTitleText({
    Key? key,
    required this.title,
    this.titleColor,
    this.isBold = false,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ConstantFontSize.meduimTitle,
        color: titleColor ?? ConstantColors.grey,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}
