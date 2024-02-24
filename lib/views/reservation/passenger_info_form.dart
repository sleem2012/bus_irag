import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/drop_down.dart';
import 'package:bus_iraq2/shared/widgets/text_field.dart';
import 'package:bus_iraq2/views/reservation/widget/passenger_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/selectable_container.dart';

class PassengerInfoForm extends StatelessWidget {
  const PassengerInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Column(
          children: [
            Text(
              "معلومات المسافر المتوفرة",
              style: KTextStyle.of(context)
                  .fifteen
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            110.h,
            Expanded(
              child: Container(
                  color: KColors.backgroundD,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        100.h,
                        Text(
                          "معلومات الراكب",
                          style: KTextStyle.of(context)
                              .ten
                              .copyWith(color: KColors.mainColor),
                        ),
                        18.h,
                        PassengerInfoCard(),
                        60.h,
                        Center(
                          child: KButton(
                            width: Get.width * .4,
                            hieght: Get.height * .05,
                            title: "احجز الأن",
                            onPressed: () {
                              NavHelper.of(context).navToReservationHistory;
                            },
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
        ChooseSeatContainer(
          onSelected: (value) {},
        )
      ],
    );
  }
}

class ChooseSeatContainer extends StatefulWidget {
  const ChooseSeatContainer({super.key, required this.onSelected});

  final ValueChanged<int> onSelected;

  @override
  State<ChooseSeatContainer> createState() => _ChooseSeatContainerState();
}

class _ChooseSeatContainerState extends State<ChooseSeatContainer> {
  int selectedSeat = -1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * .05,
      left: 26,
      right: 26,
      child: Center(
        child: Container(
          width: Get.width,
          height: Get.height * .2,
          decoration: KHelper.of(context).roundedContainer.copyWith(
              color: KColors.whiteColor,
              borderRadius: BorderRadius.circular(8)),
          // padding: EdgeInsets.all(50),
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                8,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableContainer(
                    text: "A1",
                    isSelected: selectedSeat == index,
                    onSelected: (value) {
                      setState(() {
                        selectedSeat = index;
                      });
                      widget.onSelected(selectedSeat);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
