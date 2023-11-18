import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_banking/enums/expense_type.dart';

final filterStateProvider = StateProvider((_) => ExpenseType.all);
