import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/get_ticket_model.dart';
import '../../shared/error/failures.dart';
part 'get_ticket_state.freezed.dart';

@freezed
abstract class GetTicketState with _$GetTicketState {
  const factory GetTicketState.initial() = GetTicketStateInitial;
  const factory GetTicketState.loading() = GetTicketStateLoading;
  const factory GetTicketState.success({required TicketData model}) = GetTicketStateSuccess;
  const factory GetTicketState.error({required KFailure error}) = GetTicketStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs