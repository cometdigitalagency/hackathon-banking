part of super_shy_transaction_filter;

final incomesTransactionList =
    Provider<List<SuperShyTransactionSepterateCategoryModel>>((ref) {
  final filteredTransactionList = ref.watch(filteredTransaction);
  // Create a Map to group transactions by category title
  Map<String, List<SuperShyTransactionModel>> groupedTransactions = {};

  for (var transaction in filteredTransactionList.where(
    (element) => element.isIncome,
  )) {
    // Update the map with the transaction category
    groupedTransactions.putIfAbsent(transaction.category, () => []);
    groupedTransactions[transaction.category]!.add(transaction);
  }

  // Calculate the total value for each category
  Map<String, double> categoryTotalValues = {};
  double totalValue = 0;

  groupedTransactions.forEach((category, transactions) {
    double categoryTotal =
        transactions.fold(0, (sum, transaction) => sum + transaction.value);
    categoryTotalValues[category] = categoryTotal;
    totalValue += categoryTotal;
  });

  List<SuperShyTransactionSepterateCategoryModel> result =
      groupedTransactions.entries.map((entry) {
    double categoryPercentage =
        (categoryTotalValues[entry.key] ?? 0) / totalValue * 100;
    return SuperShyTransactionSepterateCategoryModel(
      category: entry.key,
      superShyTransactionList: entry.value,
      percentage: categoryPercentage,
    );
  }).toList();

  return result;
});
