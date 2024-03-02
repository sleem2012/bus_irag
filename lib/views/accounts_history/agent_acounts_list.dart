import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';

class AgentAccountsList extends StatelessWidget {
  const AgentAccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
          top: 20, left: 20, right: 20, bottom: Get.height * .2),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16),
        decoration: KHelper.of(context).titledContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextRich(
              keyText: 'نوع الحركة: ',
              valueText: '27 يناير 2024',
            ),
            12.h,
            const CustomTextRich(
              keyText: 'رقم: ',
              valueText: '01095467036',
            ),
            12.h,
            const CustomTextRich(
              keyText: 'اسم المسافر: ',
              valueText: 'محمد احمد محمد',
            ),
            16.h,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    color: KColors.redColor,


                    child: Row(
                      children: [
                        FluxImage(imageUrl: 'assets/images/madden.svg'),
                        5.w,
                        Text(
                          "المدين",
                          style: KTextStyle.of(context).ten,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: KColors.accentColor,
                    height: 40,


                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.only(topLeft: Radius.circular(2),topRight: Radius.circular(2)),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FluxImage(imageUrl: 'assets/images/daaen.png'),
                        5.w,
                        Text(
                          "الدائن",
                          style: KTextStyle.of(context).ten,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: KColors.greenColor,


                    height: 40,

                    child: Row(

                      children: [
                        Text(
                          "رصيد",
                          style: KTextStyle.of(context).ten,
                        ),
                        5.w,

                        const FluxImage(imageUrl: 'assets/images/balance.png'),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            7.h,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    color: KColors.redColor.withOpacity(.13),


                    child: FittedBox(
                      child: Text(
                        "IQD 2000",
                        textAlign: TextAlign.center,

                        style: KTextStyle.of(context).fifteen.copyWith(color: KColors.redColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.all(10),
                    color: KColors.accentColor.withOpacity(.2),
                    height: 40,


                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.only(topLeft: Radius.circular(2),topRight: Radius.circular(2)),
                    // ),
                    child: FittedBox(
                      child: Text(
                        " IQD 200",
                        textAlign: TextAlign.center,
                        style: KTextStyle.of(context).fifteen.copyWith(color: KColors.accentColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: KColors.greenColor.withOpacity(.21),
                    height: 40,


                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.only(topLeft: Radius.circular(2),topRight: Radius.circular(2)),
                    // ),
                    child: FittedBox(
                      child: Text(
                        "1900 دينار",
                        textAlign: TextAlign.center,
                        style: KTextStyle.of(context).fifteen.copyWith(color: KColors.accentColor),
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: 4,
    );
  }
}

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  final String keyText, valueText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '$keyText ',
              style: KTextStyle.of(context)
                  .ten
                  .copyWith(color: KColors.blackColor)),
          TextSpan(
            text: valueText,
            style: KTextStyle.of(context).ten.copyWith(
                color: KColors.lightBlack, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
