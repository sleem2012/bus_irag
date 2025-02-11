import 'package:bus_iraq2/data/model/search_trip_model.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_bloc.dart';
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   CircleAvatar(
                    // backgroundColor: KColors.whiteColor,
                    child: FluxImage(
                      imageUrl: data.fleetImage??'',
                    ),
                  ),
                  8.w,
                  Text(
                    data.fleetType??'',
                    style: KTextStyle.of(context)
                        .ten
                        .copyWith(color: KColors.mainColor),
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
                    Text("موعد إلانطلاق",
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
                    Text(data.pickup??'',
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
                          data.facilities?.length??0,
                          (index) =>  Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 3),
                            child: AdvantagesContainer(facility:data.facilities?[index]??''),
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
                              text: "${data.amount.toString()} دينار",
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
                    Text("موعد الوصول",
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
                    Text(data.destination??'',
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
                TripSearchBloc.of(context).selectedTripId=data.id;
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
