import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/error/failures.dart';
part 'cancel_ticket_state.freezed.dart';

@freezed
abstract class CancelTicketState with _$CancelTicketState {
  const factory CancelTicketState.initial() = CancelTicketStateInitial;
  const factory CancelTicketState.loading() = CancelTicketStateLoading;
  const factory CancelTicketState.success() = CancelTicketStateSuccess;
  const factory CancelTicketState.error({required KFailure error}) = CancelTicketStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs