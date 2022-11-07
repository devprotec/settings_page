import 'package:mhc_customer/util/exports.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final transactions = <TransactionModel>[
    topup1,
    programTransaction,
    yogTransaction,
    topup2,
    topup3
  ];
  int currentTab = 0;
  final List<Tab> tabs = <Tab>[
    Tab(text: 'all'.tr),
    Tab(text: 'income'.tr),
    Tab(text: 'expenses'.tr),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CommonAppBAr(title: 'wallet')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Constants.spaceSmall,
          const TopUpCard(
            balance: "10 000.50",
          ),
          const SizedBox(height: 30),
          Text(
            'transactions_details'.tr,
            style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#0E1339'),
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          Constants.spaceMedium,
          CustomTabs(
            height: 40,
            tabs: tabs,
            switchTab: (index) {
              setState(() {
                currentTab = index;
              });
            },
          ),
          Constants.spaceMedium,
          Expanded(
              child: currentTab == 0
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: transactions.isEmpty ? 1 : transactions.length,
                      itemBuilder: ((context, index) {
                        return TransactionWidget(
                          transaction: transactions[index],
                        );
                      }),
                    )
                  : currentTab == 1
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              transactions.isEmpty ? 1 : transactions.length,
                          itemBuilder: ((context, index) {
                            if (!transactions[index].isDebit!) {
                              return TransactionWidget(
                                transaction: transactions[index],
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        )
                      : currentTab == 2
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: transactions.isEmpty
                                  ? 1
                                  : transactions.length,
                              itemBuilder: ((context, index) {
                                if (transactions[index].isDebit!) {
                                  return TransactionWidget(
                                    transaction: transactions[index],
                                  );
                                }
                                return const SizedBox.shrink();
                              }),
                            )
                          : const SizedBox.shrink())
        ]),
      ),
    );
  }
}
