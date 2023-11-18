part of super_shy_transaction_filter;

Future<List<String>?> showModalBottomSheetFilter(
  BuildContext context,
  WidgetRef ref, {
  required List<String> currentCategoryList,
}) {
  final formKey = GlobalKey<FormBuilderState>();

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset("assets/icons/close.svg"),
                  ),
                  const MediumTitleText(
                    title: "ຕົວກອງພິເສດ",
                    isBold: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(categoryTypeStateProvider.notifier).state = [];
                      formKey.currentState!.fields["chips"]?.didChange(null);
                    },
                    child: const MediumTitleText(
                      title: "ລ້າງ",
                      titleColor: ConstantColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallTitleText(
                  title: "ປະເພດຊຳລະ",
                  isBold: true,
                ),
                SmallTitleText(
                  title: "**ເລືອກໄດ້ຫຼາຍກວ່າ 1 ຢ່າງ",
                )
              ],
            ),
            Consumer(builder: (context, ref, child) {
              final initialCategoryFilter =
                  ref.watch(categoryTypeStateProvider);
              return FormBuilder(
                key: formKey,
                initialValue: {
                  "chips": initialCategoryFilter,
                },
                child: Column(
                  children: [
                    FormBuilderFilterChip(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      name: "chips",
                      options: [
                        ...List.generate(
                          currentCategoryList.length,
                          (index) {
                            final item = currentCategoryList[index];
                            return FormBuilderChipOption(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
            const Spacer(),
            SafeArea(
              child: MainButton(
                title: "ຕົກລົງ",
                onPressed: () {
                  final value = formKey.currentState!.fields["chips"]?.value;
                  Navigator.pop(context, value);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  ).then((value) => value);
}
