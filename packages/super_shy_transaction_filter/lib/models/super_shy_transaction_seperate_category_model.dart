part of super_shy_transaction_filter;

class SuperShyTransactionSepterateCategoryModel {
  final String category;
  final List<SuperShyTransactionModel> superShyTransactionList;
  final double percentage;

  SuperShyTransactionSepterateCategoryModel({
    required this.category,
    required this.superShyTransactionList,
    required this.percentage,
  });
}
