part of super_shy_transaction_filter;

final paymentListProvinder =
    Provider<List<SuperShyTransactionSepterateCategoryModel>>((ref) {
  final filteredTransactionList = ref.watch(filteredTransaction);
  // Create a Map to group transactions by category title
  Map<String, List<SuperShyTransactionModel>> groupedTransactions = {};

  for (var transaction in filteredTransactionList.where(
    (element) => !element.isIncome,
  )) {
    // Update the map with the transaction category
    groupedTransactions.putIfAbsent(transaction.category, () => []);
    groupedTransactions[transaction.category]!.add(transaction);
  }
  List<SuperShyTransactionSepterateCategoryModel> result =
      groupedTransactions.entries.map((entry) {
    return SuperShyTransactionSepterateCategoryModel(
      category: entry.key,
      superShyTransactionList: entry.value,
    );
  }).toList();

  return result;
});
