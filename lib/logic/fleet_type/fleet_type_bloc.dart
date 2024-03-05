import 'package:bus_iraq2/data/repository/general/general_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'fleet_type_state.dart';

class FleetTypeBloc extends Cubit<FleetTypeState> {
  FleetTypeBloc({required this.fleetTypeRepoImp})
      : super(const FleetTypeState.initial());

  static FleetTypeBloc of(BuildContext context) =>
      BlocProvider.of<FleetTypeBloc>(context);

  final GeneralRepoImp fleetTypeRepoImp;

  get({required String from, required String to, String? type}) async {
    try {
      emit(const FleetTypeState.loading());
      final result = await fleetTypeRepoImp.get_fleet(
          from: from, to: to, type: type ?? 'go');
      result.fold(
        (l) {
          debugPrint(
              '================= FleetType Bloc : ${KFailure.toError(l)}');
          emit(FleetTypeState.error(error: l));
        },
        (r) {
          debugPrint('================= FleetType Bloc : ${r.toString()}  ');
          emit(FleetTypeState.success(model: r));
        },
      );
    } catch (e) {
      rethrow;
      debugPrint('================= FleetType Bloc (Catch): ${e.toString()} ');
      emit(const FleetTypeState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
