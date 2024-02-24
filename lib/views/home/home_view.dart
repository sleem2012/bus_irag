import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/views/home/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/route/nav_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      "assets/images/slider.png",
      "assets/images/slider.png",
    ];

    return Column(
      children: [
        // const CustomHeader(),
        20.h,
        Expanded(
            child: Container(
          // color: KColors.whiteColor,
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
                15.h,
                Text(
                  "الحجوزات",
                  style: KTextStyle.of(context).ten.copyWith(
                        color: KColors.blackColor,
                      ),
                ),
                20.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RectangleHomeCard(
                        image: 'assets/images/direct_reserve.png',
                        onTap: () {
                          NavHelper.of(context).navigateToDirectReservation;
                        },
                        title: 'حجوزات مباشرة',
                      ),
                      RectangleHomeCard(
                        image: 'assets/images/customize_reserve.png',
                        onTap: () {
                          NavHelper.of(context).navigateToCustomReservation;

                        },
                        title: 'حجوزات مخصصة',
                      ),
                      RectangleHomeCard(
                        image: 'assets/images/reservehistory.png',
                        onTap: () {
                          NavHelper.of(context).navToReservationHistory;
                        },
                        title: 'سجل الحجوزات',
                      ),
                    ],
                  ),
                ),
                15.h,
                HomeSlider(
                  bannerImages: bannerImages,
                ),
                10.h,
                KButton(
                  title: "المحفظة",
                  onPressed: () {},
                  kFillColor: KColors.lightGreen,
                  iconPath: "assets/images/wallet.png",
                  textColor: KColors.greenColor,
                  borderColor: KColors.greenColor,
                  hieght: 74,
                  width: double.infinity,
                ),
                100.h,
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class RectangleHomeCard extends StatelessWidget {
  const RectangleHomeCard(
      {super.key,
      required this.image,
      required this.onTap,
      required this.title});

  final String image, title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: KHelper.of(context).roundedContainer,
            height: 90,
            width: Get.width * .23,
            child: FluxImage(
              imageUrl: image,
            ),
          ),
          3.h,
          Text(
            title,
            style:
                KTextStyle.of(context).ten.copyWith(color: KColors.mainColor),
          )
        ],
      ),
    );
  }
}
