import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/error/failures.dart';
import '../../data/model/fields_model.dart';
part 'get_manual_fields_state.freezed.dart';

@freezed
abstract class GetManualFieldsState with _$GetManualFieldsState {
  const factory GetManualFieldsState.initial() = GetManualFieldsStateInitial;
  const factory GetManualFieldsState.loading() = GetManualFieldsStateLoading;
  const factory GetManualFieldsState.success({ DynamicFieldsModel? model}) = GetManualFieldsStateSuccess;
  const factory GetManualFieldsState.error({required KFailure error}) = GetManualFieldsStateError;
  const factory GetManualFieldsState.update({required UniqueKey key}) = GetManualFieldsStateUpdate;
}
// flutter pub run build_runner watch --delete-conflicting-outputs