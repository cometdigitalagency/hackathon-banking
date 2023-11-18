part of super_shy_transaction_filter;

final filteredTransaction = Provider<List<SuperShyTransactionModel>>((ref) {
  final filter = ref.watch(filterStateProvider);
  final currentTransactionList = ref.watch(superShyListProvider);

  switch (filter) {
    case ExpenseType.payment:
      return currentTransactionList
          .where((transaction) => !transaction.isIncome)
          .toList();
    case ExpenseType.income:
      return currentTransactionList
          .where((transaction) => transaction.isIncome)
          .toList();
    case ExpenseType.all:
      return currentTransactionList;
  }
});
