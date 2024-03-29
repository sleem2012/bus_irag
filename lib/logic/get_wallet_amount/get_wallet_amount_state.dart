import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/wallet_amount_model.dart';
import '../../shared/error/failures.dart';
part 'get_wallet_amount_state.freezed.dart';

@freezed
abstract class GetWalletAmountState with _$GetWalletAmountState {
  const factory GetWalletAmountState.initial() = GetWalletAmountStateInitial;
  const factory GetWalletAmountState.loading() = GetWalletAmountStateLoading;
  const factory GetWalletAmountState.success({required WalletAmountModel model}) = GetWalletAmountStateSuccess;
  const factory GetWalletAmountState.error({required KFailure error}) = GetWalletAmountStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs