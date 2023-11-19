part of super_shy_transaction_filter;

final categoryTypeProvider = Provider<List<String>>((ref) {
  final currentTransactionList = ref.watch(superShyListProvider);

  // get all the categories type base on the mock data that have been passing by
  List<String> categories = currentTransactionList
      .map((transaction) => transaction.category)
      .toSet()
      .toList();

  return categories;
});
