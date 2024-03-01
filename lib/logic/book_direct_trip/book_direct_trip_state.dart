import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/error/failures.dart';
part 'book_direct_trip_state.freezed.dart';

@freezed
abstract class BookDirectTripState with _$BookDirectTripState {
  const factory BookDirectTripState.initial() = BookDirectTripStateInitial;
  const factory BookDirectTripState.loading() = BookDirectTripStateLoading;
  const factory BookDirectTripState.success() = BookDirectTripStateSuccess;
  const factory BookDirectTripState.error({required KFailure error}) = BookDirectTripStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs