import 'package:bus_iraq2/shared/extensions.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../shared/widgets/flux_image.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(
            "الأشعارات",
            style: KTextStyle.of(context).fifteen,
          ),
        ),
        20.h,
        Expanded(
            child: Container(
          width: double.infinity,
          // color: KColors.whiteColor,
          decoration: KHelper.of(context).circledTopContainer,
          child:
          data.isNotEmpty?
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.h,
                ...List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  child: FluxImage(
                                    imageUrl: Constant.appLogo,
                                  ),
                                ),
                                8.w,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "باص العراق",
                                          style: KTextStyle.of(context)
                                              .ten
                                              .copyWith(
                                                  color: KColors.mainColor),
                                        ),
                                        5.w,
                                        Text(
                                          "اليوم 10:30ص",
                                          style: KTextStyle.of(context)
                                              .seven
                                              .copyWith(
                                                  color: KColors.blackColor
                                                      .withOpacity(.6)),
                                        ),
                                      ],
                                    ),
                                    5.h,
                                    Text(
                                      "مرحبا بك في باص العراق",
                                      style: KTextStyle.of(context)
                                          .seven
                                          .copyWith(
                                              color: KColors.blackColor
                                                  .withOpacity(.54)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ):Center(child: Text("لا توجد اشعارات حاليا",style: KTextStyle.of(context).fifteen.copyWith(color: KColors.mainColor)),),
        ))
      ],
    );
  }
}
