import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/error/failures.dart';
part 'book_custom_trip_state.freezed.dart';

@freezed
abstract class BookCustomTripState with _$BookCustomTripState {
  const factory BookCustomTripState.initial() = BookCustomTripStateInitial;
  const factory BookCustomTripState.loading() = BookCustomTripStateLoading;
  const factory BookCustomTripState.success() = BookCustomTripStateSuccess;
  const factory BookCustomTripState.error({required KFailure error}) = BookCustomTripStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs