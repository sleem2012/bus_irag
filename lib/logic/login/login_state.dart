
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/user_model.dart';
import '../../shared/error/failures.dart';
part 'login_state.freezed.dart';

@freezed
 class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginStateInitial;
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.success({required UserModel loginModel}) = LoginStateSuccess;
  const factory LoginState.error({required KFailure failure}) = LoginStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs


