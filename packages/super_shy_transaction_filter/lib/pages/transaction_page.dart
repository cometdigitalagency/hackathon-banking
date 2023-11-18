// ignore_for_file: deprecated_member_use
part of super_shy_transaction_filter;

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year, now.month, 1);
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
          child: Column(
            children: [
              FormBuilderDateRangePicker(
                name: "date_range",
                style: const TextStyle(
                  fontSize: ConstantFontSize.meduimTitle,
                ),
                initialValue: DateTimeRange(start: firstDate, end: now),
                format: DateFormat("dd/MM/yyyy"),
                firstDate: DateTime.now().subtract(
                  const Duration(days: 1000),
                ),
                lastDate: DateTime.now(),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      "assets/icons/calendar.svg",
                    ),
                  ),
                  prefixText: "ເລືອກວັນທີ",
                ),
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final currentFilter = ref.watch(filterStateProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        ExpenseType.values.length,
                        (index) {
                          final currentFilterType = ExpenseType.values[index];
                          return GestureDetector(
                            onTap: () {
                              ref.read(filterStateProvider.notifier).state =
                                  currentFilterType;
                            },
                            child: currentFilter == currentFilterType
                                ? ActiveCustomContainerFilter(
                                    expenseType: currentFilterType,
                                  )
                                : InactiveCustomContainerFilter(
                                    expenseType: currentFilterType,
                                  ),
                          );
                        },
                      ),
                      IconCustomContainerFilter(
                        icon: SvgPicture.asset("assets/icons/filter.svg"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemBuilder: (context, index) => TransactionListContainerItem(
              transactionType: TransactionType.imcome,
              headerTitle: "ໄດ້ຮັບເງິນ",
              dateTimeText:
                  Utils.formatDateTimeInTransactionList(DateTime.now()),
              amount: Utils.getCurrency(25000),
            ),
            separatorBuilder: (context, _) => const SizedBox(height: 6),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
