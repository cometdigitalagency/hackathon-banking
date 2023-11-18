part of super_shy_transaction_filter;

final filteredTransaction = Provider<List<SuperShyTransactionModel>>((ref) {
  final filter = ref.watch(filterStateProvider);
  final currentTransactionList = ref.watch(superShyListProvider);
  final dateRange = ref.watch(dateRangeStateProvider);

  DateTime? startFrom;
  DateTime? endTo;

  if (dateRange == null) {
    startFrom = DateTime.now().subtract(const Duration(days: 30));
    endTo = DateTime.now();
  } else {
    startFrom = dateRange.start;
    endTo = dateRange.end;
  }

  switch (filter) {
    case ExpenseType.payment:
      return currentTransactionList
          .where((transaction) => !transaction.isIncome)
          .toList()
          .where(
            (transaction) =>
                transaction.date.isAfter(startFrom!) &&
                transaction.date.isBefore(endTo!),
          )
          .toList();
    case ExpenseType.income:
      return currentTransactionList
          .where((transaction) => transaction.isIncome)
          .toList()
          .where(
            (transaction) =>
                transaction.date.isAfter(startFrom!) &&
                transaction.date.isBefore(endTo!),
          )
          .toList();
    case ExpenseType.all:
      return currentTransactionList
          .where(
            (transaction) =>
                transaction.date.isAfter(startFrom!) &&
                transaction.date.isBefore(endTo!),
          )
          .toList();
  }
});
