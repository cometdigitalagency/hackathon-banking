// ignore_for_file: public_member_api_docs, sort_constructors_first
part of super_shy_transaction_filter;

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    Key? key,
    required this.percent,
    required this.category,
    required this.suffix,
    required this.value,
    this.color = ConstantColors.sucess,
  }) : super(key: key);
  final String percent;
  final String category;
  final String suffix;
  final num value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ConstantColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      "$percent%",
                      style: TextStyle(color: color),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              MediumTitleText(title: category)
            ],
          ),
          MediumTitleText(
            title: "${Utils.getCurrency(value)} $suffix",
          )
        ],
      ),
    );
  }
}
