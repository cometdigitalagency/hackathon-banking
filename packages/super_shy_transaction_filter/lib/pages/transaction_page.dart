// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use
part of super_shy_transaction_filter;

class TransactionPage extends StatefulHookConsumerWidget {
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  final _formKey = GlobalKey<FormBuilderState>();

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
              FormBuilder(
                key: _formKey,
                child: CustomDateRangeTextField(
                  name: "date_range",
                  onChange: (dateRage) {
                    if (dateRage == null) {
                      return;
                    }
                    ref.read(dateRangeStateProvider.notifier).state = dateRage;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final currentFilter = ref.watch(filterStateProvider);
                  final availableType = ref.watch(categoryTypeProvider);
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
                      GestureDetector(
                        onTap: () async {
                          final selectedvalue =
                              await showModalBottomSheetFilter(
                            context,
                            ref,
                            currentCategoryList: availableType,
                          );
                          if (selectedvalue == null || selectedvalue.isEmpty) {
                            ref.invalidate(categoryTypeStateProvider);
                            return;
                          }
                          ref.read(categoryTypeStateProvider.notifier).state =
                              selectedvalue;
                        },
                        child: IconCustomContainerFilter(
                          icon: SvgPicture.asset("assets/icons/filter.svg"),
                        ),
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
            refreshData() {
              _formKey.currentState!.fields["date_range"]?.didChange(
                DateTimeRange(
                  start: DateTime.now().subtract(
                    const Duration(days: 30),
                  ),
                  end: DateTime.now(),
                ),
              );
              ref.invalidate(filterStateProvider);
              ref.invalidate(dateRangeStateProvider);
            }

            if (filteredList.isEmpty) {
              return GestureDetector(
                onTap: () {
                  refreshData();
                  ref.invalidate(filteredTransaction);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MediumTitleText(title: "ບໍ່ພົບຂໍ້ມູນ"),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/reload.svg",
                      color: ConstantColors.primary,
                    )
                  ],
                ),
              );
            }
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  refreshData();
                  return ref.invalidate(filteredTransaction);
                },
                child: ListView.separated(
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
              ),
            );
          },
        ),
      ],
    );
  }
}
