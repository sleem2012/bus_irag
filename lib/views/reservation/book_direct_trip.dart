import 'package:bus_iraq2/data/model/seats_model.dart';
import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/book_direct_trip/book_direct_trip_bloc.dart';
import 'package:bus_iraq2/logic/choose_seet/choose_seet_bloc.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:bus_iraq2/views/reservation/widget/passenger_info_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../logic/book_direct_trip/book_direct_trip_state.dart';
import '../../logic/choose_seet/choose_seet_state.dart';
import '../../logic/get_ticket/get_ticket_bloc.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/selectable_container.dart';

class BookDirectTripView extends StatelessWidget {
  const BookDirectTripView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Di.chooseSeat,
        ),
        BlocProvider(
          create: (context) => Di.bookDirectTrip,
        ),
      ],
      child: BlocConsumer<BookDirectTripBloc, BookDirectTripState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              KHelper.customAwosmeDialog(
                title: "تم الحجز بنجاح",
                onApproveClick: () {
                  GetTicketBloc.of(context).get();

                  NavHelper.of(context).navToReservationHistory;
                },
              );
            },
          );
        },
        builder: (context, bookState) {
          final bookTrip = BookDirectTripBloc.of(context);
          return BlocBuilder<ChooseSeetBloc, ChooseSeetState>(
            builder: (context, state) {
              final seatBloc = ChooseSeetBloc.of(context);
              final searchBloc = TripSearchBloc.of(context);
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
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: PassengerInfoCard(
                                      seatName:
                                          seatBloc.seats[index].name ?? '',
                                      nameController:
                                          bookTrip.namesControllerList[index],
                                      phoneController:
                                          bookTrip.phoneControllerList[index],
                                      genderChanged: (String value) {
                                        bookTrip.gender[index] = value;
                                      },
                                    ),
                                  ),
                                ),
                                30.h,
                                if (seatBloc.seats.isNotEmpty)
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 150.0),
                                    child: Center(
                                      child: KButton(
                                        isLoading: bookState
                                            is BookDirectTripStateLoading,
                                        width: Get.width * .4,
                                        hieght: Get.height * .05,
                                        title: "احجز الأن",
                                        onPressed: () {
                                          bookTrip.addListValues(
                                              listed: seatBloc.seats,
                                              sentSearchModel:
                                                  searchBloc.sentModel,
                                              tripId:
                                                  searchBloc.selectedTripId ??
                                                      -1);
                                          bookTrip.book();
                                        },
                                      ),
                                    ),
                                  ),
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
                    onNew: (bool value) {
                      if (!value) {
                        bookTrip.namesControllerList.removeLast();
                        bookTrip.phoneControllerList.removeLast();
                        bookTrip.gender.removeLast();
                      } else {
                        bookTrip.namesControllerList
                            .add(TextEditingController());
                        bookTrip.phoneControllerList
                            .add(TextEditingController());
                        bookTrip.gender.add('');
                      }
                    },
                    tripId: searchBloc.selectedTripId.toString(),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class ChooseSeatContainer extends StatefulWidget {
  const ChooseSeatContainer(
      {super.key,
      required this.onSelected,
      required this.onNew,
      required this.tripId});

  final ValueChanged<List<Seats>> onSelected;
  final ValueChanged<bool> onNew;
  final String tripId;

  @override
  State<ChooseSeatContainer> createState() => _ChooseSeatContainerState();
}

class _ChooseSeatContainerState extends State<ChooseSeatContainer> {
  List<Seats> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.chooseSeat..getSeats(tripId: widget.tripId),
      child: BlocBuilder<ChooseSeetBloc, ChooseSeetState>(
        builder: (context, state) {
          final seatData = ChooseSeetBloc.of(context).seatsData;
          final seatsWithoutFirst=seatData?.seats?.skipWhile((value) => value.name=="A1").toList()??[];
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 39, vertical: 16),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        runSpacing: 15,
                        children: [
                          if (seatData != null &&
                              (seatData.seats ?? []).isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectableContainer(
                                  text: seatData.seats?[0].name,
                                  isSelected: selectedSeats
                                      .contains(seatData.seats![0]),
                                  onSelected: (value) {
                                    setState(
                                      () {
                                        if (selectedSeats
                                            .contains(seatData.seats![0])) {
                                          selectedSeats
                                              .remove(seatData.seats![0]);
                                        } else {
                                          selectedSeats
                                              .add(seatData.seats![0]);
                                        }
                                      },
                                    );
                                    widget.onSelected(selectedSeats);
                                    widget.onNew(value);
                                  },
                                ),
                                const DriverSeatContainer(),
                              ],
                            ),

                          // 50.h,
                          ...List.generate(


                            seatsWithoutFirst.length,
                                (index) {
                              // if (index != 0) {
                              return SelectableContainer(
                                text: seatsWithoutFirst[index].name,
                                isSelected: selectedSeats
                                    .contains(seatsWithoutFirst[index]),
                                onSelected: (value) {
                                  setState(() {
                                    if (selectedSeats
                                        .contains(seatsWithoutFirst[index])) {
                                      selectedSeats
                                          .remove(seatsWithoutFirst[index]);
                                    } else {
                                      selectedSeats.add(
                                          seatsWithoutFirst[index] ?? Seats());
                                    }
                                  });
                                  widget.onSelected(selectedSeats);
                                  widget.onNew(value);
                                },
                              );
                              // }
                            },
                          ),

                          // Wrap(
                          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   // runAlignment: WrapAlignment.center,
                          //   // alignment: WrapAlignment.center,
                          //   // textDirection: TextDirection.ltr,
                          //   // spacing:Get.width*.1,
                          //   textDirection: TextDirection.ltr,
                          //   children: List.generate(
                          //     10,
                          //     (index) {
                          //       // if (index != 0) {
                          //       return SelectableContainer(
                          //         text: seatData?.seats?[0].name,
                          //         isSelected: selectedSeats
                          //             .contains(seatData?.seats?[0]),
                          //         onSelected: (value) {
                          //           setState(() {
                          //             if (selectedSeats
                          //                 .contains(seatData?.seats?[0])) {
                          //               selectedSeats
                          //                   .remove(seatData?.seats?[0]);
                          //             } else {
                          //               selectedSeats.add(
                          //                   seatData?.seats?[0] ?? Seats());
                          //             }
                          //           });
                          //           widget.onSelected(selectedSeats);
                          //           widget.onNew(value);
                          //         },
                          //       );
                          //       // }
                          //     },
                          //   ),
                          // ),
                          // SizedBox(
                          //   // width: 140,
                          //   height: 55,
                          //   child: ListView.separated(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     reverse: true,
                          //
                          //     // physics: NeverScrollableScrollPhysics(),
                          //
                          //     itemBuilder: (context, index) {
                          //       if (index != 0) {
                          //         return SelectableContainer(
                          //           text: seatData?.seats?[index].name,
                          //           isSelected: selectedSeats
                          //               .contains(seatData?.seats?[index]),
                          //           onSelected: (value) {
                          //             setState(() {
                          //               if (selectedSeats.contains(
                          //                   seatData?.seats?[index])) {
                          //                 selectedSeats.remove(
                          //                     seatData?.seats?[index]);
                          //               } else {
                          //                 selectedSeats.add(
                          //                     seatData?.seats?[index] ??
                          //                         Seats());
                          //               }
                          //             });
                          //             widget.onSelected(selectedSeats);
                          //             widget.onNew(value);
                          //           },
                          //         );
                          //       } else {
                          //         return const SizedBox
                          //             .shrink(); // Skip the first item
                          //       }
                          //     },
                          //     itemCount: seatData?.seats?.length ?? 0,
                          //     dragStartBehavior: DragStartBehavior.start,
                          //     separatorBuilder:
                          //         (BuildContext context, int index) {
                          //       return SizedBox(
                          //         width: Get.width * .15,
                          //       );
                          //     },
                          //   ),
                          // )
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DriverSeatContainer extends StatelessWidget {
  const DriverSeatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: KColors.mainColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const FluxImage(
        imageUrl: 'assets/images/driver_icon.svg',
      ),
    );
  }
}
