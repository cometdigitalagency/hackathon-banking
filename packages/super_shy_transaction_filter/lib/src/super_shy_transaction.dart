part of super_shy_transaction_filter;

class SuperShyTransaction extends StatelessWidget {
  const SuperShyTransaction({super.key});

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
