import 'package:bus_iraq2/data/repository/direct_trip/direct_trip_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/sent_trip_search_model.dart';
import '../../shared/error/failures.dart';
import 'trip_search_state.dart';

class TripSearchBloc extends Cubit<TripSearchState> {
  TripSearchBloc({required this.tripSearchRepoImp})
      : super(const TripSearchState.initial());

  static TripSearchBloc of(BuildContext context) =>
      BlocProvider.of<TripSearchBloc>(context);

  final DirectTripRepoImp tripSearchRepoImp;
  SentTripSearchModel sentModel = SentTripSearchModel();

  post() async {
    try {
      sentModel=sentModel.copyWith(
          type: 'go'
      );
      emit(const TripSearchState.loading());
      final result = await tripSearchRepoImp.search_trip(model: sentModel);
      result.fold(
        (l) {
          debugPrint(
              '================= TripSearch Bloc : ${KFailure.toError(l)}');
          emit(TripSearchState.error(error: l));
        },
        (r) {
          debugPrint('================= TripSearch Bloc : ${r.toString()}  ');
          emit(TripSearchState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= TripSearch Bloc (Catch): ${e.toString()} ');
      emit(const TripSearchState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  void setPickupDirection(String pickId) {
    sentModel = sentModel.copyWith(pickup: pickId);
  }

  void setDestinationDirection(String destinationId) {
    sentModel = sentModel.copyWith(destination: destinationId);
  }

  void setTripType(String type) {
    sentModel = sentModel.copyWith(type: type);
  }

  void setGoDate(String date) {
    sentModel = sentModel.copyWith(goDate: date);
  }

  void setReturnDate(String date) {
    sentModel = sentModel.copyWith(backDate: date);
  }
}
