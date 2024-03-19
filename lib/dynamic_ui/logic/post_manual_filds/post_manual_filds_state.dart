import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/error/failures.dart';
part 'post_manual_filds_state.freezed.dart';

@freezed
abstract class PostManualFildsState with _$PostManualFildsState {
  const factory PostManualFildsState.initial() = PostManualFildsStateInitial;
  const factory PostManualFildsState.loading() = PostManualFildsStateLoading;
  const factory PostManualFildsState.success() = PostManualFildsStateSuccess;
  const factory PostManualFildsState.error({required KFailure error}) = PostManualFildsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs