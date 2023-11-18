import 'package:flutter/material.dart';

import '../../common/medium_title_text.dart';
import '../../constants/constant_color.dart';
import '../../enums/transaction_type.dart';
import '../../utils/utils.dart';
import '../../widgets/title_header_graphic.dart';
import 'widgets/tranaction_container_item.dart';
import 'widgets/user_information_card_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * .35), // Set the desired height
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140),
              child: AppBar(
                elevation: 0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ConstantColors.mainGradient,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // Other AppBar properties and customization can be added here
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: UserInformationCardSection(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleHeaderGraphic(
                  color: ConstantColors.primary,
                  title: "ທຸລະກຳລ້າສຸດ",
                ),
                MediumTitleText(
                  title: "ເບິ່ງທັງໝົດ",
                  titleColor: ConstantColors.primary,
                )
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 60),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TransactionListContainerItem(
                    transactionType: index % 2 == 0
                        ? TransactionType.imcome
                        : TransactionType.payment,
                    headerTitle: index % 2 == 0 ? "ໄດ້ຮັບເງິນ" : "ຊຳລະເງິນ",
                    dateTimeText:
                        Utils.formatDateTimeInTransactionList(DateTime.now()),
                    amount: Utils.getCurrency(50000 * (index + 1)),
                  );
                },
                separatorBuilder: (context, _) => const SizedBox(height: 6),
                itemCount: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
