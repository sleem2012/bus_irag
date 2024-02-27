import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/widgets/travel_check_list.dart';
import 'package:flutter/material.dart';
import '../../shared/date_container.dart';
import '../../shared/route/nav_helper.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/drop_down.dart';
import '../../shared/widgets/titled_container.dart';

class CustomReservation extends StatelessWidget {
  const CustomReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "حجوزات مخصصة",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                30.h,
                 TravelCheckList(
                  backgroundColor: KColors.whiteColor, onChange: (String value) {  },
                ),
                30.h,
                KDropdownBtn(
                  title: "نقطة انطلاق",
                  onChanged: (p0) {},
                  items: [
                    KHelper.of(context)
                        .itemView(itemText: "كربلاء", value: "e"),
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateContainer(
                      title: "تاريخ الذهاب",
                      firstContainerColor: KColors.accentColor,
                      secondTextColor: KColors.accentColor, onPressed: (String value) {  },
                    ),
                    DateContainer(
                      firstTextColor: KColors.greenColor,
                      secondTextColor: KColors.greenColor,
                      firstContainerColor: KColors.lightGreen,
                      title: 'تاريخ العودة', onPressed: (String value) {  },
                    ),
                  ],
                ),
                29.h,
                KDropdownBtn(
                  title: "نوع المركبة",
                  onChanged: (p0) {},
                  items: [
                    KHelper.of(context).itemView(itemText: "اودي", value: "e"),
                    KHelper.of(context).itemView(itemText: "نيسان", value: "e"),
                  ],
                  hintColor: KColors.mainColor,
                  btnDecoration: KHelper.of(context).circledTopContainer,
                ),
                60.h,
                Center(
                  child: KButton(
                    // isLoading: true,
                    title: "ادخل بياناتك الأن",
                    onPressed: () {
                      NavHelper.of(context).navigateToCustomTripForm;
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
