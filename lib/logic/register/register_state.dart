import 'package:bus_iraq2/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/error/failures.dart';
part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterStateInitial;
  const factory RegisterState.loading() = RegisterStateLoading;
  const factory RegisterState.success({required UserModel model}) = RegisterStateSuccess;
  const factory RegisterState.error({required KFailure error}) = RegisterStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs