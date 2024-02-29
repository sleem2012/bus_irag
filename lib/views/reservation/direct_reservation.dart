import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/get_locations/get_locations_state.dart';
import 'package:bus_iraq2/logic/main_view/main_view_bloc.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_state.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/model/booking_locations.dart';
import '../../logic/get_locations/get_locations_bloc.dart';
import '../../logic/trip_search/trip_search_bloc.dart';
import '../../shared/date_container.dart';
import '../../shared/error/failures.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/travel_check_list.dart';
import '../home/widget/home_slider.dart';

class DirectReservation extends StatelessWidget {
  const DirectReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      "assets/images/slider.png",
      "assets/images/slider.png",
    ];
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<TripSearchBloc, TripSearchState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (model) {
            NavHelper.of(context).navigateToAvailableTrips;
          },
        );
      },
      builder: (context, state) {
        final searchBloc = TripSearchBloc.of(context);
        return Form(
          key: formKey,
          child: Column(
            children: [
              20.h,
              Expanded(
                  child: Container(
                decoration: KHelper.of(context).circledTopContainer,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h,
                      HomeSlider(
                        // bannerImages: [],
                      ),
                      10.h,
                      TravelCheckList(
                        onChange: (String value) {
                          searchBloc.setTripType(value);
                        },
                      ),
                      30.h,
                      BlocBuilder<GetLocationsBloc, GetLocationsState>(
                        builder: (context, state) {
                          final location =
                              GetLocationsBloc.of(context).locationsData;

                          return Column(
                            children: [
                              KDropdownBtn<LocationInnerData>(
                                validator: (values) {
                                  if (values == null) {
                                    return "الحقل مطلوب";
                                  } else {
                                    return null;
                                  }
                                },
                                title: "نقطة انطلاق",
                                onChanged: (p0) {
                                  searchBloc.setPickupDirection(
                                      p0?.id.toString() ?? '');
                                },
                                items: location?.data
                                        ?.map((e) => KHelper.of(context)
                                            .itemView(
                                                itemText: e.name ?? '',
                                                value: e))
                                        .toList() ??
                                    [],
                                hintColor: KColors.redColor,
                              ),
                              12.h,
                              KDropdownBtn<LocationInnerData>(
                                title: "نقطة وصول",
                                validator: (values) {
                                  if (values == null) {
                                    return "الحقل مطلوب";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (p0) {
                                  searchBloc.setDestinationDirection(
                                      p0?.id.toString() ?? '');
                                },
                                items: location?.data
                                        ?.map((e) => KHelper.of(context)
                                            .itemView(
                                                itemText: e.name ?? '',
                                                value: e))
                                        .toList() ??
                                    [],
                                hintColor: KColors.greenColor,
                                suffixIcon: const Icon(
                                  Icons.location_on,
                                  color: KColors.greenColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      50.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateContainer(
                            title: "تاريخ الذهاب",
                            onPressed: (String value) {
                              searchBloc.setGoDate(value);
                            },
                          ),
                          if (searchBloc.travelType == 'back')
                            DateContainer(
                              firstTextColor: KColors.boldGreenColor,
                              secondTextColor: KColors.boldGreenColor,
                              firstContainerColor: KColors.lightBlueColor,
                              title: 'تاريخ العودة',
                              onPressed: (String value) {
                                searchBloc.setReturnDate(value);
                              },
                            ),
                        ],
                      ),
                      60.h,
                      Padding(
                        padding:  EdgeInsets.only(bottom: Get.height*.15),
                        child: Center(
                          child: KButton(
                            isLoading: state is TripSearchStateLoading,
                            title: "أبحث الأن",
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                searchBloc.post();
                              }
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
