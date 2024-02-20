import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import 'flux_image.dart';

class KButton extends StatelessWidget {
  const KButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.hieght,
      this.isLoading = false,
      this.kFillColor,
      this.isFlat = false,
      this.iconPath});

  final String title;
  final bool? isLoading;
  final Color? kFillColor;
  final Function() onPressed;
  final double? width, hieght;
  final String? iconPath;
  final bool isFlat;

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? FluxImage(
            imageUrl: "assets/json/Animation - 1708377844738.json",
            height: Get.height * .15,
            alignment: Alignment.center,
          )
        : ElevatedButton(
            onPressed: isLoading ?? false ? null : onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: kFillColor ?? KColors.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: width ?? Get.width / 1.1,
                height: hieght ?? Get.height * .064,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconPath != null)
                      Image.asset(
                        iconPath ?? '',
                      ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      title,
                      style: KTextStyle.of(context).btnTitle,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
