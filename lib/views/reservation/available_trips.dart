import 'package:bus_iraq2/data/model/search_trip_model.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../logic/trip_search/trip_search_state.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/titled_container.dart';
import 'widget/available_trip_card.dart';

class AvailableTrips extends StatelessWidget {
  const AvailableTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripSearchBloc, TripSearchState>(
      builder: (context, state) {
        final searchResponse =
            TripSearchBloc.of(context).responseData?.innerData;
        return KRequestOverlay(
          isLoading: state is TripSearchStateLoading,
          child: Column(
            children: [
              const TitledContainer(
                title: "الرحلات المتوفره",
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
                          top: 20,
                          left: 20,
                          right: 20,
                          bottom: Get.height * .2),
                      itemBuilder: (context, index) => AvailableTripCard(
                            data: searchResponse?[index] ?? InnerSearchData(),
                          ),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: searchResponse?.length ?? 0),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}

class AdvantagesContainer extends StatelessWidget {
  const AdvantagesContainer({super.key, required this.facility});
final String facility;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.lightBlueColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: FittedBox(
        child: Text(
          facility,
          style:
              KTextStyle.of(context).ten.copyWith(color: KColors.mainColor),
        ),
      ),
    );
  }
}
