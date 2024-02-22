import 'package:bus_iraq2/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/helper.dart';
import '../theme/text_theme.dart';

class TitledContainer extends StatelessWidget {
  const TitledContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        60.h,
        Container(
          decoration: KHelper.of(context).titledContainer,
          width: Get.width * .85,
          height: Get.height * .05,
          child: Center(
              child: Text(
            title,
            style: KTextStyle.of(context).fifteen.copyWith(
                color: KColors.blackColor, fontWeight: FontWeight.w400),
          )),
        ),
        20.h,
      ],
    );
  }
}
