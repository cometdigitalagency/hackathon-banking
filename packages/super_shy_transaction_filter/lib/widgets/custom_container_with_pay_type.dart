// ignore_for_file: public_member_api_docs, sort_constructors_first
part of super_shy_transaction_filter;

class CustomContainerWithPayType extends StatelessWidget {
  const CustomContainerWithPayType({
    Key? key,
    required this.title,
    required this.value,
    this.valueColor,
    required this.subfixTitle,
  }) : super(key: key);

  final String title;
  final num value;
  final Color? valueColor;
  final String subfixTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: ConstantFontSize.smallTitle,
          ),
        ),
        MediumTitleText(
          title: "${Utils.getCurrency(value)} $subfixTitle",
          titleColor: valueColor,
          isBold: true,
        ),
      ],
    );
  }
}
