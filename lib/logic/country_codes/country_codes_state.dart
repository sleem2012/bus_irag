import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/country_codes.dart';
import '../../shared/error/failures.dart';
part 'country_codes_state.freezed.dart';

@freezed
abstract class CountryCodesState with _$CountryCodesState {
  const factory CountryCodesState.initial() = CountryCodesStateInitial;
  const factory CountryCodesState.loading() = CountryCodesStateLoading;
  const factory CountryCodesState.success({required CountryCodesModel model}) = CountryCodesStateSuccess;
  const factory CountryCodesState.error({required KFailure error}) = CountryCodesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs