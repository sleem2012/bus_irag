import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/error/failures.dart';
part 'choose_seet_state.freezed.dart';

@freezed
abstract class ChooseSeetState with _$ChooseSeetState {
  const factory ChooseSeetState.initial() = ChooseSeetStateInitial;
  const factory ChooseSeetState.updateList() = ChooseSeetStateupdateList;
  const factory ChooseSeetState.loading() = ChooseSeetStateLoading;
  const factory ChooseSeetState.success() = ChooseSeetStateSuccess;
  const factory ChooseSeetState.error({required KFailure error}) = ChooseSeetStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs