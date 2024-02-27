import 'package:bus_iraq2/data/model/search_trip_model.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/flux_image.dart';
import '../available_trips.dart';

class AvailableTripCard extends StatelessWidget {
  const AvailableTripCard({super.key, required this.data});
  final InnerSearchData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: KHelper.of(context).titledContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    // backgroundColor: KColors.whiteColor,
                    child: FluxImage(
                      imageUrl: Constant.appLogo,
                    ),
                  ),
                  8.w,
                  Column(
                    children: [
                      Text(
                        "باصات العراق",
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.mainColor),
                      ),
                      Text(
                        "28/1/204",
                        style: KTextStyle.of(context).seven.copyWith(
                            color: KColors.blackColor.withOpacity(.25)),
                      ),
                    ],
                  )
                ],
              ),
              KButton(
                title: "مباشر",
                onPressed: () {},
                width: Get.width * .25,
                hieght: Get.height * .035,
              )
            ],
          ),
          8.h,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("موعد الحضور",
                        style: KTextStyle.of(context)
                            .seven
                            .copyWith(color: KColors.accentColor)),
                    9.h,
                    Text(data.startDate??'',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.mainColor)),
                    9.h,
                    Text("من مدينة",
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.accentColor)),
                    9.h,
                    Text("بغداد",
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.mainColor)),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("وسائل الراحة",
                          style: KTextStyle.of(context)
                              .seven
                              .copyWith(color: KColors.accentColor)),
                      8.h,
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          2,
                          (index) => const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 3),
                            child: AdvantagesContainer(),
                          ),
                        ),
                      ),
                      14.h,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "سعر الرحلة" '  ',
                                style: KTextStyle.of(context)
                                    .ten
                                    .copyWith(color: KColors.blackColor)),
                            TextSpan(
                              text: "300 دينار",
                              style: KTextStyle.of(context)
                                  .ten
                                  .copyWith(color: KColors.greenColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text("موعد الأنطلاق",
                        style: KTextStyle.of(context)
                            .seven
                            .copyWith(color: KColors.accentColor)),
                    9.h,
                    Text(data.endDate??'',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.mainColor)),
                    9.h,
                    Text("الي",
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.accentColor)),
                    9.h,
                    Text("بغداد",
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.mainColor)),
                  ],
                ),
              ],
            ),
          ),
          10.h,
          Center(
            child: KButton(
              title: "احجز الأن",
              onPressed: () {
                NavHelper.of(context).navigateToPassengerInfo;
              },
              width: Get.width * .4,
              // isLoading: true,
              hieght: Get.height * .04,
            ),
          )
        ],
      ),
    );
  }
}
