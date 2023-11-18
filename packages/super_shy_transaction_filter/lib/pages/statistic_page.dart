part of super_shy_transaction_filter;

class StatisticPage extends ConsumerWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: Consumer(
            builder: (context, ref, child) {
              final filteredList = ref.watch(filteredTransaction);
              double sumIncome = filteredList
                  .where((transaction) => transaction.isIncome)
                  .fold(0, (sum, transaction) => sum + transaction.value);
              double sumPayment = filteredList
                  .where((transaction) => !transaction.isIncome)
                  .fold(0, (sum, transaction) => sum + transaction.value);
              return Column(
                children: [
                  CustomDateRangeTextField(
                    name: "date_range",
                    onChange: (dateRage) {
                      if (dateRage == null) {
                        return;
                      }
                      ref.read(dateRangeStateProvider.notifier).state =
                          dateRage;
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainerWithPayType(
                          title: "ລາຍຮັບ",
                          value: sumIncome,
                          subfixTitle: "LAK",
                          valueColor: ConstantColors.sucess,
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(),
                        ),
                        CustomContainerWithPayType(
                          title: "ລາຍຈ່າຍ",
                          value: sumPayment,
                          subfixTitle: "LAK",
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 12, left: 12),
              child: TitleHeaderGraphic(
                color: ConstantColors.sucess,
                title: "ລາຍຮັບ",
              ),
            ),
            const SizedBox(height: 10),
            Consumer(
              builder: (context, ref, child) {
                final incomeTransaction = ref.watch(incomesTransactionList);
                return Column(
                  children: List.generate(
                    incomeTransaction.length,
                    (index) {
                      final item = incomeTransaction[index];
                      double sumPayment = item.superShyTransactionList
                          .where((transaction) => transaction.isIncome)
                          .fold(
                              0, (sum, transaction) => sum + transaction.value);
                      return CategoriesListItem(
                        percent: "60",
                        category: item.category,
                        suffix: "LAK",
                        value: sumPayment,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 12, left: 12),
              child: TitleHeaderGraphic(
                color: ConstantColors.primary,
                title: "ລາຍຈ່າຍ",
              ),
            ),
            const SizedBox(height: 10),
            Consumer(
              builder: (context, ref, child) {
                final incomeTransaction = ref.watch(paymentListProvinder);
                return Column(
                  children: List.generate(
                    incomeTransaction.length,
                    (index) {
                      final item = incomeTransaction[index];
                      double sumPayment = item.superShyTransactionList
                          .where((transaction) => !transaction.isIncome)
                          .fold(
                              0, (sum, transaction) => sum + transaction.value);
                      return CategoriesListItem(
                        color: ConstantColors.primary,
                        percent: "60",
                        category: item.category,
                        suffix: "LAK",
                        value: sumPayment,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
