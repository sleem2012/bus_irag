import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import '../../shared/location_serv.dart';
import 'location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState> {
  GetLocationCubit() : super(const GetLocationState.initial());

  static GetLocationCubit of(context) =>
      BlocProvider.of<GetLocationCubit>(context);

  LocationData? currentPosition;

  Future<Either<KFailure, LocationData>> initLocation() async {
    try {
      emit(const GetLocationState.loading());
      final position = await KLocationService.call();
      position.fold(
        (l) {
          emit(GetLocationState.error(error: KFailure.toError(l)));
          debugPrint('================= ${KFailure.toError(l)} : ');
        },
        (r) async {
          currentPosition = r;
          debugPrint('=================  curre ${r.longitude}');
          emit(GetLocationState.success(pos: currentPosition!));
        },
      );
      return position;
    } catch (e) {
      emit(GetLocationState.error(error: Tr.get.something_went_wrong));
      debugPrint('=================  initLocation : $e ');
      rethrow;
    }
  }
}
