part of super_shy_transaction_filter;

final filteredTransaction = Provider<List<SuperShyTransactionModel>>((ref) {
  //listen to our ExpenseType changing
  final filter = ref.watch(filterStateProvider);

  //listen to our mock transactions list
  final currentTransactionList = ref.watch(superShyListProvider);

  //listen to our date range selector
  final dateRange = ref.watch(dateRangeStateProvider);

  //listen to catecory type filter
  final selectedCategoryTypeList = ref.watch(categoryTypeStateProvider);

  DateTime? startFrom;
  DateTime? endTo;

  // if there is no date range we set initial value to last 30 days
  if (dateRange == null) {
    startFrom = DateTime.now().subtract(const Duration(days: 30));
    endTo = DateTime.now();
  } else {
    startFrom = dateRange.start;
    endTo = dateRange.end;
  }

  // get only payment filter list base on all filter senerio but not with the categories type
  final List<SuperShyTransactionModel> paymentList = currentTransactionList
      .where((transaction) => !transaction.isIncome)
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();

  // get only incomes filter list base on all filter senerio but not with the categories type
  final List<SuperShyTransactionModel> incomesList = currentTransactionList
      .where((transaction) => transaction.isIncome)
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();

  // get all filter list base on all filter senerio but not with the categories type
  final List<SuperShyTransactionModel> allList = currentTransactionList
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();

  // return our transactions list with all filters
  switch (filter) {
    case ExpenseType.payment:
      if (selectedCategoryTypeList.isEmpty) {
        return paymentList;
      }
      return paymentList
          .where((transaction) =>
              selectedCategoryTypeList.contains(transaction.category))
          .toList();
    case ExpenseType.income:
      if (selectedCategoryTypeList.isEmpty) {
        return incomesList;
      }
      return incomesList
          .where((transaction) =>
              selectedCategoryTypeList.contains(transaction.category))
          .toList();
    case ExpenseType.all:
      if (selectedCategoryTypeList.isEmpty) {
        return allList;
      }
      return allList
          .where((transaction) =>
              selectedCategoryTypeList.contains(transaction.category))
          .toList();
  }
});
