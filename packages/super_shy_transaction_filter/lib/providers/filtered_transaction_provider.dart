part of super_shy_transaction_filter;

final filteredTransaction = Provider<List<SuperShyTransactionModel>>((ref) {
  final filter = ref.watch(filterStateProvider);
  final currentTransactionList = ref.watch(superShyListProvider);
  final dateRange = ref.watch(dateRangeStateProvider);
  final selectedCategoryTypeList = ref.watch(categoryTypeStateProvider);

  DateTime? startFrom;
  DateTime? endTo;

  if (dateRange == null) {
    startFrom = DateTime.now().subtract(const Duration(days: 30));
    endTo = DateTime.now();
  } else {
    startFrom = dateRange.start;
    endTo = dateRange.end;
  }

  final List<SuperShyTransactionModel> paymentList = currentTransactionList
      .where((transaction) => !transaction.isIncome)
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();
  final List<SuperShyTransactionModel> incomesList = currentTransactionList
      .where((transaction) => transaction.isIncome)
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();
  final List<SuperShyTransactionModel> allList = currentTransactionList
      .where(
        (transaction) =>
            transaction.date.isAfter(startFrom!) &&
            transaction.date.isBefore(endTo!),
      )
      .toList();

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
