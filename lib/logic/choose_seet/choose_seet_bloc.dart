import 'package:bus_iraq2/data/model/seats_model.dart';
import 'package:bus_iraq2/data/repository/direct_trip/direct_trip_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'choose_seet_state.dart';

class ChooseSeetBloc extends Cubit<ChooseSeetState> {
  ChooseSeetBloc({required this.chooseSeetRepoImp})
      : super(const ChooseSeetState.initial());

  static ChooseSeetBloc of(BuildContext context) =>
      BlocProvider.of<ChooseSeetBloc>(context);

  final DirectTripRepoImp chooseSeetRepoImp;



  SeatsData? seatsData;
  getSeats({required String? tripId}) async {
    try {
      emit(const ChooseSeetState.loading());
      final result = await chooseSeetRepoImp.get_seats(tripId: tripId??'7');
      result.fold(
        (l) {
          debugPrint('================= ChooseSeet Bloc : ${KFailure.toError(l)}');
          emit(ChooseSeetState.error(error: l));
        },
        (r) {
          seatsData = r;
          debugPrint('================= ChooseSeet Bloc : ${r.toString()}  ');
          emit(const ChooseSeetState.success());
        },
      );
    } catch (e) {
      debugPrint('================= ChooseSeet Bloc (Catch): ${e.toString()} ');
      emit(const ChooseSeetState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  List<Seats> seats = [];

  void updateListLength(List<Seats> selected) {
    seats = selected;
    emit(const ChooseSeetState.initial());
    emit(const ChooseSeetState.updateList());
  }
}
