import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';

import '../../shared/date_container.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/travel_check_list.dart';
import '../home/widget/home_slider.dart';

class DirectReservation extends StatelessWidget {
  const DirectReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      "assets/images/slider.png",
      "assets/images/slider.png",
    ];

    return Column(
      children: [
        20.h,
        Expanded(
            child: Container(
          decoration: KHelper.of(context).circledTopContainer,
            child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h,
                HomeSlider(
                  bannerImages: bannerImages,
                ),
                10.h,
                const TravelCheckList(),
                30.h,
                KDropdownBtn(
                  title: "نقطة انطلاق",
                  onChanged: (p0) {},
                  items: [
                    KHelper.of(context).itemView(itemText: "كربلاء", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                  ],
                  hintColor: KColors.redColor,
                ),
                12.h,
                KDropdownBtn(
                  title: "نقطة وصول",
                  onChanged: (p0) {},
                  items: [
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                    KHelper.of(context).itemView(itemText: "بغداد", value: "e"),
                  ],
                  hintColor: KColors.greenColor,
                  suffixIcon: const Icon(
                    Icons.location_on,
                    color: KColors.greenColor,
                  ),
                ),
                50.h,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateContainer(
                      title: "تاريخ الذهاب",
                    ),
                    DateContainer(
                      firstTextColor: KColors.boldGreenColor,
                      secondTextColor: KColors.boldGreenColor,
                      firstContainerColor: KColors.lightBlueColor,
                      title: 'تاريخ العودة',
                    ),
                  ],
                ),
                60.h,
                Center(
                  child: KButton(
                    // isLoading: true,
                    title: "أبحث الأن",
                    onPressed: () {
                      NavHelper.of(context).navigateToAvailableTrips;
                      // Get.to(()=>Container());
                    },
                  ),
                ),
                20.h,
              ],
            ),
          ),
        ))
      ],
    );
  }
}
