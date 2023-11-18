part of super_shy_transaction_filter;

class SuperShyTransaction extends ConsumerWidget {
  const SuperShyTransaction({
    super.key,
    required this.superShyTransactionList,
  });

  final List<SuperShyTransactionModel> superShyTransactionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Expanded(
            child: TabBarView(
              children: [
                TransactionPage(
                  superShyTransactionModel: superShyTransactionList,
                ),
                const StatisticPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
