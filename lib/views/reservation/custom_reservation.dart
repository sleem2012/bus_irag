import 'package:bus_iraq2/data/model/fleet_type_model.dart';
import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/fleet_type/fleet_type_bloc.dart';
import 'package:bus_iraq2/logic/fleet_type/fleet_type_state.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/widgets/travel_check_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/booking_locations.dart';
import '../../logic/get_locations/get_locations_bloc.dart';
import '../../logic/get_locations/get_locations_state.dart';
import '../../logic/trip_search/trip_search_state.dart';
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
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => Di.getFleets,
      child: Column(
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
              child: BlocConsumer<TripSearchBloc, TripSearchState>(
                listener: (context, state) {
                  state.whenOrNull(
                    selected: () {
                      FleetTypeBloc.of(context).get(
                          from:
                              TripSearchBloc.of(context).sentModel.pickup ?? '',
                          to: TripSearchBloc.of(context)
                                  .sentModel
                                  .destination ??
                              '');
                    },
                  );
                },
                builder: (context, state) {
                  final searchBloc = TripSearchBloc.of(context);
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        30.h,
                        TravelCheckList(
                          backgroundColor: KColors.whiteColor,
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
                              firstContainerColor: KColors.accentColor,
                              secondTextColor: KColors.accentColor,
                              onPressed: (String value) {
                                searchBloc.setGoDate(value);
                              },
                            ),
                            if (searchBloc.travelType == 'back')
                            DateContainer(
                              firstTextColor: KColors.greenColor,
                              secondTextColor: KColors.greenColor,
                              firstContainerColor: KColors.lightGreen,
                              title: 'تاريخ العودة',
                              onPressed: (String value) {
                                searchBloc.setReturnDate(value);
                              },
                            ),
                          ],
                        ),
                        29.h,
                        if (searchBloc.sentModel.pickup != null)
                          BlocBuilder<FleetTypeBloc, FleetTypeState>(
                            builder: (context, state) {
                              final fleet = state.whenOrNull(
                                success: (model) => model.data,
                              );
                              return fleet?.isNotEmpty == true
                                  ? KDropdownBtn<FleetTypeData>(
                                      validator: (values) {
                                        if (values == null) {
                                          return "الحقل مطلوب";
                                        } else {
                                          return null;
                                        }
                                      },
                                      title: state is FleetTypeStateLoading
                                          ? "تحميل"
                                          : "نوع المركبة",
                                      onChanged: (p0) {
                                        searchBloc.setFleetType(
                                            p0?.id.toString() ?? '');
                                      },
                                      items: fleet
                                              ?.map((e) => KHelper.of(context)
                                                  .itemView(
                                                      itemText: e.name ?? '',
                                                      value: e))
                                              .toList() ??
                                          [],
                                      hintColor: KColors.mainColor,
                                      btnDecoration: KHelper.of(context)
                                          .circledTopContainer,
                                    )
                                  : const SizedBox();
                            },
                          ),
                        60.h,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Center(
                            child: KButton(
                              title: "ادخل بياناتك الأن",
                              onPressed: () {
                                if (kDebugMode) {
                                  print(searchBloc.sentModel.toJson());
                                }
                                if (formKey.currentState!.validate()) {
                                  NavHelper.of(context)
                                      .navigateToCustomTripForm;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
