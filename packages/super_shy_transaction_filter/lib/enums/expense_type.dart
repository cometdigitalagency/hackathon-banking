part of super_shy_transaction_filter;

enum ExpenseType {
  all("ທັງໝົດ"),
  payment("ລາຍຈ່າຍ"),
  income("ລາຍຮັບ");

  const ExpenseType(this.title);
  final String title;
}
