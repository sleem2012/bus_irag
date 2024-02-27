import 'package:bus_iraq2/data/model/seats_model.dart';
import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/choose_seet/choose_seet_bloc.dart';
import 'package:bus_iraq2/logic/choose_seet/choose_seet_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:bus_iraq2/views/reservation/widget/passenger_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../logic/choose_seet/choose_seet_state.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/selectable_container.dart';

class PassengerInfoForm extends StatelessWidget {
  const PassengerInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.chooseSeat,
      child: BlocBuilder<ChooseSeetBloc, ChooseSeetState>(
        builder: (context, state) {
          final seatBloc = ChooseSeetBloc.of(context);
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
                            if (seatBloc.seats.isNotEmpty)
                              Text(
                                "معلومات الراكب",
                                style: KTextStyle.of(context)
                                    .ten
                                    .copyWith(color: KColors.mainColor),
                              ),
                            18.h,
                            ...List.generate(
                              seatBloc.seats.length,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: PassengerInfoCard(
                                  seatName: seatBloc.seats[index].name ?? '',
                                ),
                              ),
                            ),
                            30.h,
                            Center(
                              child: KButton(
                                width: Get.width * .4,
                                hieght: Get.height * .05,
                                title: "احجز الأن",
                                onPressed: () {
                                  NavHelper.of(context).navToReservationHistory;
                                },
                              ),
                            ),
                            100.h,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ChooseSeatContainer(
                onSelected: (value) {
                  seatBloc.updateListLength(value);
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class ChooseSeatContainer extends StatefulWidget {
  const ChooseSeatContainer({super.key, required this.onSelected});

  final ValueChanged<List<Seats>> onSelected;

  @override
  State<ChooseSeatContainer> createState() => _ChooseSeatContainerState();
}

class _ChooseSeatContainerState extends State<ChooseSeatContainer> {
  List<Seats> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.chooseSeat..getSeats(),
      child: BlocBuilder<ChooseSeetBloc, ChooseSeetState>(
        builder: (context, state) {
          final seatData = ChooseSeetBloc.of(context).seatsData;
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                child: KRequestOverlay(
                  isLoading: state is ChooseSeetStateLoading,
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: List.generate(
                        seatData?.seats?.length ?? 0,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectableContainer(
                            text: seatData?.seats?[index].name,
                            isSelected:
                                selectedSeats.contains(seatData!.seats![index]),
                            onSelected: (value) {
                              setState(() {
                                if (selectedSeats
                                    .contains(seatData.seats![index])) {
                                  selectedSeats.remove(seatData.seats![index]);
                                } else {
                                  selectedSeats.add(seatData.seats![index]);
                                }
                              });
                              widget.onSelected(selectedSeats);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
