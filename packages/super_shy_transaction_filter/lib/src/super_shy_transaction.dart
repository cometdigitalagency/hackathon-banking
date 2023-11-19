part of super_shy_transaction_filter;

class SuperShyTransaction extends StatefulHookConsumerWidget {
  const SuperShyTransaction({
    super.key,
    required this.superShyTransactionList,
  });

  final List<SuperShyTransactionModel> superShyTransactionList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SuperShyTransactionState();
}

class _SuperShyTransactionState extends ConsumerState<SuperShyTransaction> {
  @override
  void initState() {
    setDataToState(widget.superShyTransactionList);
    super.initState();
  }

  // set our mock data
  setDataToState(List<SuperShyTransactionModel> superShyList) async {
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(superShyListProvider.notifier).state = superShyList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          Container(
            color: ConstantColors.white,
            child: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: ConstantColors.primary,
              unselectedLabelColor: ConstantColors.grey,
              labelColor: ConstantColors.primary,
              tabs: <Widget>[
                Tab(
                  icon: Text("ການເຄື່ອນໄຫວ"),
                ),
                Tab(
                  icon: Text("ສະຖິຕິ"),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                TransactionPage(),
                StatisticPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
