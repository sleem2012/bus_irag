import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/small_button.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/titled_container.dart';

class ReservationHistory extends StatelessWidget {
  const ReservationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "سجل الحجوزات",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: ListView.separated(
              padding: EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: Get.height * .2),
              itemBuilder: (context, index) => const ReservationHistoryCard(),
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

class ReservationHistoryCard extends StatelessWidget {
  const ReservationHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: KHelper.of(context).titledContainer.copyWith(
          border: Border.all(color: KColors.blackColor.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "رقم الحجز:" '  ',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.blackColor)),
                    TextSpan(
                      text: "1045",
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: KColors.mainColor),
                    ),
                  ],
                ),
              ),
              SmallButton(
                title: "سحب التذكرة",
                textColor: KColors.mainColor,
                kFillColor: KColors.mainColor.withOpacity(.2),
                hieght: Get.height * .035,
                width: Get.width * .25,
                iconPath: "assets/images/ticket.png",
                onPressed: () {},
              )
            ],
          ),
          18.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "اسم الراكب:" '  ',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.blackColor)),
                    TextSpan(
                      text: "سراج الدين محمد",
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: KColors.mainColor),
                    ),
                  ],
                ),
              ),
              SmallButton(
                title: "الغاء الحجز",
                textColor: KColors.boldRedColor,
                kFillColor: KColors.redColor.withOpacity(.13),
                hieght: Get.height * .035,
                width: Get.width * .25,
                iconPath: "assets/images/cancel_reserve.png",
                onPressed: () {},
              )
            ],
          ),
          10.h,
          Divider(
            color: KColors.blackColor.withOpacity(.1),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NameWithIcon(
                iconPath: "assets/images/money_bag.png",
                keyText: "مبلغ الحجز",
                valueText: "200 دينار",
              ),
              NameWithIcon(
                iconPath: "assets/images/money_bag.png",
                keyText: "مبلغ التسديد",
                valueText: "200 دينار",
              ),
              NameWithIcon(
                iconPath: "assets/images/commision.png",
                keyText: "عمولة الوكيل",
                valueText: "50 دينار",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NameWithIcon extends StatelessWidget {
  const NameWithIcon(
      {super.key,
      required this.iconPath,
      required this.keyText,
      required this.valueText});

  final String iconPath;
  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FluxImage(imageUrl: iconPath),
        5.w,
        Column(
          children: [
            Text(
              keyText,
              style:
                  KTextStyle.of(context).ten.copyWith(color: KColors.mainColor),
            ),
            2.h,
            Text(
              valueText,
              style: KTextStyle.of(context)
                  .seven
                  .copyWith(color: KColors.blackColor.withOpacity(.42)),
            ),
          ],
        )
      ],
    );
  }
}
