part of super_shy_transaction_filter;

SuperShyTransactionModel superShyTransactionModelFromJson(String str) =>
    SuperShyTransactionModel.fromJson(json.decode(str));

String superShyTransactionModelToJson(SuperShyTransactionModel data) =>
    json.encode(data.toJson());

class SuperShyTransactionModel {
  String title;
  int value;
  bool isIncome;
  DateTime date;
  String suffixTitle;
  String category;

  SuperShyTransactionModel({
    required this.title,
    required this.value,
    required this.isIncome,
    required this.date,
    required this.suffixTitle,
    required this.category,
  });

  factory SuperShyTransactionModel.fromJson(Map<String, dynamic> json) =>
      SuperShyTransactionModel(
        title: json["title"],
        value: json["value"],
        isIncome: json["is_income"],
        date: DateTime.parse(json["date"]),
        suffixTitle: json["suffix_title"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
        "is_income": isIncome,
        "date": date.toIso8601String(),
        "suffix_title": suffixTitle,
        "category": category,
      };
}
