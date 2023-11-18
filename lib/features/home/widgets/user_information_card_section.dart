import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_banking/features/home/providers/is_show_info_state_provider.dart';

import '../../../common/medium_title_text.dart';
import '../../../common/small_title_text.dart';
import '../../../constants/constant_color.dart';
import '../../../widgets/custom_container_icon.dart';
import '../../../widgets/custom_container_with_pay_type.dart';
import '../../../widgets/user_avatar.dart';

class UserInformationCardSection extends StatelessWidget {
  const UserInformationCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              const UserAvatar(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MediumTitleText(
                    title: "20 XXXX XXXX",
                    isBold: true,
                    titleColor: ConstantColors.white,
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: ConstantColors.white.withOpacity(.08),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/check.svg"),
                        const SizedBox(width: 6),
                        const SmallTitleText(
                          title: "ຢືນຢັນແລ້ວ",
                          color: ConstantColors.white,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ConstantColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ConstantColors.grey.withOpacity(.01),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Consumer(builder: (context, ref, child) {
              final isShowInfo = ref.watch(isShowInfoProvider);
              return Column(children: [
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomContainerIcon(
                          icon: SvgPicture.asset("assets/icons/bag.svg"),
                          color: ConstantColors.primary.withOpacity(.1),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SmallTitleText(title: "ຍອດເງິນຂອງທ່ານ"),
                            MediumTitleText(
                              title: isShowInfo
                                  ? "200,000.00 LAK"
                                  : "XXXXXXXXX LAK",
                              isBold: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(isShowInfoProvider.notifier).state =
                            !ref.read(isShowInfoProvider.notifier).state;
                      },
                      child: CustomContainerIcon(
                        icon: isShowInfo
                            ? SvgPicture.asset("assets/icons/eye_open.svg")
                            : SvgPicture.asset("assets/icons/eye_close.svg"),
                        color: ConstantColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Divider(),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MediumTitleText(
                      title: "ການເຄື່ອນໄຫວ",
                      isBold: true,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ConstantColors.grey.withOpacity(.1),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "ພະຈິກ 2023",
                            style: TextStyle(
                              color: ConstantColors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            "assets/icons/calendar.svg",
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainerWithPayType(
                        title: "ລາຍຮັບ",
                        value: isShowInfo ? 25000000 : null,
                        subfixTitle: "LAK",
                        valueColor: ConstantColors.sucess,
                      ),
                      const SizedBox(
                        height: 40,
                        child: VerticalDivider(),
                      ),
                      CustomContainerWithPayType(
                        title: "ລາຍຈ່າຍ",
                        value: isShowInfo ? 3000000 : null,
                        subfixTitle: "LAK",
                      ),
                    ],
                  ),
                )
              ]);
            }),
          ),
        ],
      ),
    );
  }
}
