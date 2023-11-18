// ignore_for_file: public_member_api_docs, sort_constructors_first
part of super_shy_transaction_filter;

class TitleHeaderGraphic extends StatelessWidget {
  const TitleHeaderGraphic({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: VerticalDivider(
            width: 2,
            thickness: 4,
            color: color,
          ),
        ),
        const SizedBox(width: 16),
        MediumTitleText(
          title: title,
          isBold: true,
        )
      ],
    );
  }
}
