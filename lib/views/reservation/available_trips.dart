import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme/colors.dart';
import '../../shared/widgets/titled_container.dart';
import 'widget/available_trip_card.dart';

class AvailableTrips extends StatelessWidget {
  const AvailableTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "28 يناير 2024",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.separated(
                padding: EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: Get.height * .2),
                itemBuilder: (context, index) => const AvailableTripCard(),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 4),
          ),
        ))
      ],
    );
  }
}

class AdvantagesContainer extends StatelessWidget {
  const AdvantagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.lightBlueColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: FittedBox(
        child: Row(
          children: [
            Text(
              "ماء",
              style:
                  KTextStyle.of(context).ten.copyWith(color: KColors.mainColor),
            ),
            5.w,
            const Icon(
              Icons.wifi,
            ),
          ],
        ),
      ),
    );
  }
}
