import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/text_theme.dart';

class TravelCheckList extends StatefulWidget {
  const TravelCheckList({super.key});

  @override
  State<TravelCheckList> createState() => _TravelCheckListState();
}

class _TravelCheckListState extends State<TravelCheckList> {
  final List<String> travelType = [
    "ذهاب فقط",
    "ذهاب وعودة",
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * .63,
        height: Get.height * .05,
        decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    // contentPadding: EdgeInsets.zero,
                    shape: const StadiumBorder(),

                    activeColor: KColors.greenColor,

                    value: selected == index,
                    onChanged: (value) {
                      setState(() {
                        selected = index;
                      });
                    },
                  ),
                  Text(
                    travelType[index],
                    style: KTextStyle.of(context)
                        .ten
                        .copyWith(color: KColors.mainColor),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
            const VerticalDivider(color: KColors.vDividerColor),
            itemCount: 2),
      ),
    );
  }
}

