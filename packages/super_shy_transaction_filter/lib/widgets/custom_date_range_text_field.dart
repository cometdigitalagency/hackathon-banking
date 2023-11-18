part of super_shy_transaction_filter;

typedef OnChange = Function(DateTimeRange? dateRage);

class CustomDateRangeTextField extends ConsumerWidget {
  const CustomDateRangeTextField({
    super.key,
    required this.name,
    required this.onChange,
  });

  final String name;
  final OnChange onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderDateRangePicker(
      name: name,
      style: const TextStyle(
        fontSize: ConstantFontSize.meduimTitle,
      ),
      initialValue: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 30)),
        end: DateTime.now(),
      ),
      format: DateFormat("dd/MM/yyyy"),
      firstDate: DateTime.now().subtract(
        const Duration(days: 1000),
      ),
      lastDate: DateTime.now(),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SvgPicture.asset(
            "assets/icons/calendar.svg",
          ),
        ),
        prefixText: "ເລືອກວັນທີ",
      ),
      onChanged: onChange,
    );
  }
}
