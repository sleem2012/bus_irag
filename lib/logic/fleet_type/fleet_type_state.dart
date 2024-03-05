import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/fleet_type_model.dart';
import '../../shared/error/failures.dart';
part 'fleet_type_state.freezed.dart';

@freezed
abstract class FleetTypeState with _$FleetTypeState {
  const factory FleetTypeState.initial() = FleetTypeStateInitial;
  const factory FleetTypeState.loading() = FleetTypeStateLoading;
  const factory FleetTypeState.success({required FleetTypeModel model}) = FleetTypeStateSuccess;
  const factory FleetTypeState.error({required KFailure error}) = FleetTypeStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs