import 'package:bus_iraq2/data/repository/general/general_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/booking_locations.dart';
import '../../shared/error/failures.dart';
import 'get_locations_state.dart';

class GetLocationsBloc extends Cubit<GetLocationsState> {
  GetLocationsBloc({required this.getLocationsRepoImp})
      : super(const GetLocationsState.initial());

  static GetLocationsBloc of(BuildContext context) =>
      BlocProvider.of<GetLocationsBloc>(context);

  final GeneralRepoImp getLocationsRepoImp;
  LocationsData? locationsData;

  get() async {
    try {
      emit(const GetLocationsState.loading());
      final result = await getLocationsRepoImp.get_locations();
      result.fold(
        (l) {
          debugPrint(
              '================= GetLocations Bloc : ${KFailure.toError(l)}');
          emit(GetLocationsState.error(error: l));
        },
        (r) {
          locationsData = r;
          debugPrint('================= GetLocations Bloc : ${r.toString()}  ');
          emit(GetLocationsState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint(
          '================= GetLocations Bloc (Catch): ${e.toString()} ');
      emit(const GetLocationsState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
