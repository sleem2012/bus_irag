import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../shared/route/nav_helper.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/titled_container.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "المحفظة",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                130.h,
                Container(
                  decoration: BoxDecoration(
                    color: KColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الرصيد المتاح",
                        style: KTextStyle.of(context).fifteen,
                      ),
                      Text(
                        "IQD 2000",
                        style: KTextStyle.of(context).fifteen,
                      ),
                    ],
                  ),
                ),
                20.h,
                KButton(
                  title: "اضافة رصيد",
                  onPressed: () {
                    NavHelper.of(context).navigateAddMoney;
                  },
                  kFillColor: KColors.lightGreen,
                  iconPath: "assets/images/wallet.png",
                  textColor: KColors.greenColor,
                  borderColor: KColors.greenColor,
                  hieght: 74,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
