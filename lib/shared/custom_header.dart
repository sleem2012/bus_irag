import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/shared/widgets/icon_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    child: FluxImage(
                      imageUrl: Constant.appLogo,
                    ),
                  ),
                  8.w,
                  Text(
                    "محمد احمد",
                    style: KTextStyle.of(context).ten,
                  )
                ],
              ),
              Row(
                children: [
                  const KIconButton(
                    child: FluxImage(
                      imageUrl: "assets/images/notification.png",
                      color: KColors.accentColor,
                    ),
                  ),
                  10.w,
                  const KIconButton(
                    child: FluxImage(
                      imageUrl: "assets/images/home.png",
                      color: KColors.accentColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
