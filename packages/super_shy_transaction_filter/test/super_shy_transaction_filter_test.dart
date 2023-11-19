import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_transaction_filter/super_shy_transaction_filter.dart';

void main() {
  test('superShyListProvider initializes with an empty list', () async {
    final container = ProviderContainer();
    final superShyList = container.read(superShyListProvider);
    // Verify that the initial value is an empty list
    expect(superShyList, isEmpty);
    container.dispose();
  });

  test('dateRangeStateProvider initializes with null', () async {
    final container = ProviderContainer();
    final dateRange = container.read(dateRangeStateProvider);

    // Verify that the initial value is null
    expect(dateRange, isNull);
    container.dispose();
  });

  test('filterStateProvider initializes with ExpenseType.all', () async {
    final container = ProviderContainer();
    final filterState = container.read(filterStateProvider);

    // Verify that the initial value is ExpenseType.all
    expect(filterState, ExpenseType.all);
    container.dispose();
  });

  test('categoryTypeProvider returns unique categories', () {
    // Arrange
    final container = ProviderContainer();
    final mockTransactions = [
      SuperShyTransactionModel(
        title: "ໄດ້ຮັບເງິນ",
        value: 20000,
        isIncome: true,
        date: DateTime.now().subtract(const Duration(days: 20)),
        suffixTitle: "LAK",
        category: "ອາຫານ",
      ),
      SuperShyTransactionModel(
        title: "ຊຳລະເງິນ",
        value: 200000,
        isIncome: false,
        date: DateTime.now().subtract(const Duration(days: 10)),
        suffixTitle: "LAK",
        category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
      ),
      SuperShyTransactionModel(
        title: "ຊຳລະເງິນ",
        value: 300000,
        isIncome: true,
        date: DateTime.now().subtract(const Duration(days: 10)),
        suffixTitle: "LAK",
        category: "ສຸຂະພາບ",
      ),
      SuperShyTransactionModel(
        title: "ໄດ້ຮັບເງິນ",
        value: 20000,
        isIncome: true,
        date: DateTime.now(),
        suffixTitle: "LAK",
        category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
      ),
      SuperShyTransactionModel(
        title: "ຊຳລະເງິນ",
        value: 200000,
        isIncome: false,
        date: DateTime.now().subtract(const Duration(days: 1)),
        suffixTitle: "LAK",
        category: "ອາຫານ",
      ),
    ];

    // Override the value of superShyListProvider with mockTransactions
    container.read(superShyListProvider.notifier).state = mockTransactions;
    final categories = container.read(categoryTypeProvider);

    expect(categories, ['ອາຫານ', 'ຂອງຂັວນ ແລະ ການບໍລິຈາກ', 'ສຸຂະພາບ']);
  });
}
