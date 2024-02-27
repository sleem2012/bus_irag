import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/booking_locations.dart';
import '../../shared/error/failures.dart';
part 'get_locations_state.freezed.dart';

@freezed
abstract class GetLocationsState with _$GetLocationsState {
  const factory GetLocationsState.initial() = GetLocationsStateInitial;
  const factory GetLocationsState.loading() = GetLocationsStateLoading;
  const factory GetLocationsState.success({required LocationsData model}) = GetLocationsStateSuccess;
  const factory GetLocationsState.error({required KFailure error}) = GetLocationsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs