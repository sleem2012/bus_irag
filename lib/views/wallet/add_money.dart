import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/shared/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/custom_radio_listtile.dart';
import '../../shared/widgets/titled_container.dart';

class AddMoneyView extends StatelessWidget {
  const AddMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "اضافة رصيد",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                20.h,
                KTextFormField(
                  labelText: 'المبلغ',
                  keyboardType: TextInputType.number,
                  suffixIcon: Stack(
                    alignment: Alignment.center,
                    children: [
                      const FluxImage(
                        imageUrl: 'assets/images/iqd.png',
                      ),
                      Text(
                        'IQD',
                        style: KTextStyle.of(context)
                            .fifteen
                            .copyWith(color: KColors.mainColor),
                      )
                    ],
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Tr.get.field_required;
                    }
                    return null;
                  },
                ),
                30.h,
                CustomRadioListTile(
                  valueChanged: (int value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                ),
                25.h,

                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: KButton(
                    width: Get.width*.6,
                    title: "اضافة حوالة",
                    onPressed: () {
                      NavHelper.of(context).navigateToManualPayment;
                    },
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
