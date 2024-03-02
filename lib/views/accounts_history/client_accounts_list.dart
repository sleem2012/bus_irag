import 'package:bus_iraq2/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import 'accounts_history_view.dart';

class ClientAccountsList extends StatelessWidget {
  const ClientAccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(
            top: 20, left: 20, right: 20, bottom: Get.height * .2),
        itemBuilder: (context, index) => const ClientAccountsHistoryCard(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: 4);
  }
}

class ClientAccountsHistoryCard extends StatelessWidget {
  const ClientAccountsHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: KHelper.of(context).titledContainer.copyWith(
          border: Border.all(color: KColors.blackColor.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextRichWithIcon(
            keyText: 'تاريخ:',
            valueText: '7 فبراير 2024',
            imagePath: 'assets/images/calender_icon.png',
          ),
          14.h,
          const TextRichWithIcon(
            keyText: 'مسار:',
            valueText: 'بغداد الى كربلاء المقدسة',
            imagePath: 'assets/images/bus-ticket-icon 1.png',
          ),
          14.h,
          const Row(
            children: [
              Expanded(
                  flex: 2,
                  child: TextRichWithIcon(
                    keyText: 'عدد:',
                    valueText: '4 ركاب',
                    imagePath: 'assets/images/two_persons.png',
                  )),
              Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: TextRichWithIcon(
                  keyText: 'السعر:',
                  valueText: '40الفIQD ',
                  imagePath: 'assets/images/money_bag.png',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
