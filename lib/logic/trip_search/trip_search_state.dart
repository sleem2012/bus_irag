import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/search_trip_model.dart';
import '../../shared/error/failures.dart';
part 'trip_search_state.freezed.dart';

@freezed
abstract class TripSearchState with _$TripSearchState {
  const factory TripSearchState.initial() = TripSearchStateInitial;
  const factory TripSearchState.loading() = TripSearchStateLoading;
  const factory TripSearchState.selected() = TripSearchStateselected;
  const factory TripSearchState.success({required SearchData model}) = TripSearchStateSuccess;
  const factory TripSearchState.error({required KFailure error}) = TripSearchStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs