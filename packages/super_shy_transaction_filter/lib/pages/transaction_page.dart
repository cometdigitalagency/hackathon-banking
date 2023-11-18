// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use
part of super_shy_transaction_filter;

class TransactionPage extends StatefulHookConsumerWidget {
  const TransactionPage({
    Key? key,
    required this.superShyTransactionModel,
  }) : super(key: key);

  final List<SuperShyTransactionModel> superShyTransactionModel;

  @override
  ConsumerState<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  @override
  void initState() {
    setDataToState(widget.superShyTransactionModel);
    super.initState();
  }

  setDataToState(List<SuperShyTransactionModel> superShyList) async {
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(superShyListProvider.notifier).state = superShyList;
  }

  @override
  Widget build(BuildContext context) {
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
                initialValue: DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 30)),
                  end: DateTime.now(),
                ),
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
        Consumer(
          builder: (context, ref, child) {
            final filteredList = ref.watch(filteredTransaction);
            return Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final transactionItem = filteredList[index];
                  return TransactionListContainerItem(
                    transactionType: transactionItem.isIncome
                        ? TransactionType.imcome
                        : TransactionType.payment,
                    headerTitle: transactionItem.title,
                    dateTimeText: Utils.formatDateTimeInTransactionList(
                        transactionItem.date),
                    amount: Utils.getCurrency(transactionItem.value),
                  );
                },
                separatorBuilder: (context, _) => const SizedBox(height: 6),
                itemCount: filteredList.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
