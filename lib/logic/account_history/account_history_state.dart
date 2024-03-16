import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/account_history_model.dart';
import '../../shared/error/failures.dart';
part 'account_history_state.freezed.dart';

@freezed
abstract class AccountHistoryState with _$AccountHistoryState {
  const factory AccountHistoryState.initial() = AccountHistoryStateInitial;
  const factory AccountHistoryState.loading() = AccountHistoryStateLoading;
  const factory AccountHistoryState.success({required AccountData model}) = AccountHistoryStateSuccess;
  const factory AccountHistoryState.error({required KFailure error}) = AccountHistoryStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs