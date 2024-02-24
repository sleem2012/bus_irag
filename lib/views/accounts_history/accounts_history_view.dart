import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/small_button.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/titled_container.dart';

class AccountsHistory extends StatelessWidget {
  const AccountsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "سجل الحسابات",
        ),
        Expanded(
            child: Container(
              color: KColors.backgroundD,
              width: double.infinity,
              child: ListView.separated(
                  padding: EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: Get.height * .2),
                  itemBuilder: (context, index) => const AccountsHistoryCard(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 4),
            ))
      ],
    );
  }
}

class AccountsHistoryCard extends StatelessWidget {
  const AccountsHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: KHelper.of(context).titledContainer.copyWith(
          border: Border.all(color: KColors.blackColor.withOpacity(.1))),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextRichWithIcon(keyText: 'تاريخ:',valueText: '7 فبراير 2024', imagePath: 'assets/images/calender_icon.png',),
          14.h,
          const TextRichWithIcon(keyText: 'مسار:',valueText: 'بغداد الى كربلاء المقدسة', imagePath: 'assets/images/bus-ticket-icon 1.png',),
          14.h,
          
           const Row(
            children: [
              Expanded(flex: 2,child: TextRichWithIcon(keyText: 'عدد:',valueText: '4 ركاب', imagePath: 'assets/images/two_persons.png',)),
              Spacer(flex: 1),
              Expanded(flex: 2,child: TextRichWithIcon(keyText: 'السعر:',valueText: '40الفIQD ', imagePath: 'assets/images/money_bag.png',)),

            ],
          )


        ],
      ),
    );
  }
}

class TextRichWithIcon extends StatelessWidget {
  const TextRichWithIcon({super.key, required this.keyText, required this.valueText, required this.imagePath});
final String keyText,valueText,imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '$keyText  ',
                  style: KTextStyle.of(context)
                      .ten
                      .copyWith(color: KColors.mainColor)),
              TextSpan(
                text: valueText,
                style: KTextStyle.of(context)
                    .ten
                    .copyWith(color: KColors.blackColor.withOpacity(.53)),
              ),
            ],
          ),
        ),
        FluxImage(imageUrl: imagePath)
      ],
    );
  }
}
