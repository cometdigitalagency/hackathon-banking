part of super_shy_transaction_filter;

final categoryTypeProvider = Provider<List<String>>((ref) {
  final currentTransactionList = ref.watch(superShyListProvider);

  List<String> categories = currentTransactionList
      .map((transaction) => transaction.category)
      .toSet()
      .toList();

  return categories;
});
