import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/large_title_text.dart';
import '../../common/medium_title_text.dart';
import '../../common/small_title_text.dart';
import '../../constants/constant_color.dart';

Future<bool> showErrorDialog(
  BuildContext context, {
  required String title,
  required String contentText,
  int maxline = 1,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Center(
          child: SvgPicture.asset(
            "assets/svg/error.svg",
            width: 96,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LargeTitleText(title: title),
            SmallTitleText(
              title: contentText,
              maxLine: maxline,
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  onTap: () => Navigator.pop(context, true),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1.8,
                          color: ConstantColors.grey.withOpacity(.2),
                        ),
                      ),
                    ),
                    child: const MediumTitleText(
                      title: "ຕົກລົງ",
                      isBold: true,
                      titleColor: ConstantColors.errorColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],

        // content: ,
      );
    },
  ).then((value) => value ?? false);
}
