import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/banner_model.dart';
import '../../shared/error/failures.dart';
part 'banner_state.freezed.dart';

@freezed
abstract class BannerState with _$BannerState {
  const factory BannerState.initial() = BannerStateInitial;
  const factory BannerState.loading() = BannerStateLoading;
  const factory BannerState.success({required BannerModel model}) = BannerStateSuccess;
  const factory BannerState.error({required KFailure error}) = BannerStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs