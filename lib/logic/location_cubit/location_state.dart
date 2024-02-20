import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
part 'location_state.freezed.dart';

@freezed
class GetLocationState with _$GetLocationState {
  const factory GetLocationState.initial() = GetLocationInitial;
  const factory GetLocationState.loading() = GetLocationLoading;
  const factory GetLocationState.success({required LocationData pos}) = GetLocationSuccess;
  const factory GetLocationState.error({required String error}) = GetLocationError;
}
