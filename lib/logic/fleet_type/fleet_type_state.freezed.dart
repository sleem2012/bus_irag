// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fleet_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FleetTypeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FleetTypeModel model) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FleetTypeModel model)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FleetTypeModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FleetTypeStateInitial value) initial,
    required TResult Function(FleetTypeStateLoading value) loading,
    required TResult Function(FleetTypeStateSuccess value) success,
    required TResult Function(FleetTypeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FleetTypeStateInitial value)? initial,
    TResult? Function(FleetTypeStateLoading value)? loading,
    TResult? Function(FleetTypeStateSuccess value)? success,
    TResult? Function(FleetTypeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FleetTypeStateInitial value)? initial,
    TResult Function(FleetTypeStateLoading value)? loading,
    TResult Function(FleetTypeStateSuccess value)? success,
    TResult Function(FleetTypeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FleetTypeStateCopyWith<$Res> {
  factory $FleetTypeStateCopyWith(
          FleetTypeState value, $Res Function(FleetTypeState) then) =
      _$FleetTypeStateCopyWithImpl<$Res, FleetTypeState>;
}

/// @nodoc
class _$FleetTypeStateCopyWithImpl<$Res, $Val extends FleetTypeState>
    implements $FleetTypeStateCopyWith<$Res> {
  _$FleetTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FleetTypeStateInitialCopyWith<$Res> {
  factory _$$FleetTypeStateInitialCopyWith(_$FleetTypeStateInitial value,
          $Res Function(_$FleetTypeStateInitial) then) =
      __$$FleetTypeStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FleetTypeStateInitialCopyWithImpl<$Res>
    extends _$FleetTypeStateCopyWithImpl<$Res, _$FleetTypeStateInitial>
    implements _$$FleetTypeStateInitialCopyWith<$Res> {
  __$$FleetTypeStateInitialCopyWithImpl(_$FleetTypeStateInitial _value,
      $Res Function(_$FleetTypeStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FleetTypeStateInitial implements FleetTypeStateInitial {
  const _$FleetTypeStateInitial();

  @override
  String toString() {
    return 'FleetTypeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FleetTypeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FleetTypeModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FleetTypeModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FleetTypeModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FleetTypeStateInitial value) initial,
    required TResult Function(FleetTypeStateLoading value) loading,
    required TResult Function(FleetTypeStateSuccess value) success,
    required TResult Function(FleetTypeStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FleetTypeStateInitial value)? initial,
    TResult? Function(FleetTypeStateLoading value)? loading,
    TResult? Function(FleetTypeStateSuccess value)? success,
    TResult? Function(FleetTypeStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FleetTypeStateInitial value)? initial,
    TResult Function(FleetTypeStateLoading value)? loading,
    TResult Function(FleetTypeStateSuccess value)? success,
    TResult Function(FleetTypeStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FleetTypeStateInitial implements FleetTypeState {
  const factory FleetTypeStateInitial() = _$FleetTypeStateInitial;
}

/// @nodoc
abstract class _$$FleetTypeStateLoadingCopyWith<$Res> {
  factory _$$FleetTypeStateLoadingCopyWith(_$FleetTypeStateLoading value,
          $Res Function(_$FleetTypeStateLoading) then) =
      __$$FleetTypeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FleetTypeStateLoadingCopyWithImpl<$Res>
    extends _$FleetTypeStateCopyWithImpl<$Res, _$FleetTypeStateLoading>
    implements _$$FleetTypeStateLoadingCopyWith<$Res> {
  __$$FleetTypeStateLoadingCopyWithImpl(_$FleetTypeStateLoading _value,
      $Res Function(_$FleetTypeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FleetTypeStateLoading implements FleetTypeStateLoading {
  const _$FleetTypeStateLoading();

  @override
  String toString() {
    return 'FleetTypeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FleetTypeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FleetTypeModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FleetTypeModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FleetTypeModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FleetTypeStateInitial value) initial,
    required TResult Function(FleetTypeStateLoading value) loading,
    required TResult Function(FleetTypeStateSuccess value) success,
    required TResult Function(FleetTypeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FleetTypeStateInitial value)? initial,
    TResult? Function(FleetTypeStateLoading value)? loading,
    TResult? Function(FleetTypeStateSuccess value)? success,
    TResult? Function(FleetTypeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FleetTypeStateInitial value)? initial,
    TResult Function(FleetTypeStateLoading value)? loading,
    TResult Function(FleetTypeStateSuccess value)? success,
    TResult Function(FleetTypeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FleetTypeStateLoading implements FleetTypeState {
  const factory FleetTypeStateLoading() = _$FleetTypeStateLoading;
}

/// @nodoc
abstract class _$$FleetTypeStateSuccessCopyWith<$Res> {
  factory _$$FleetTypeStateSuccessCopyWith(_$FleetTypeStateSuccess value,
          $Res Function(_$FleetTypeStateSuccess) then) =
      __$$FleetTypeStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({FleetTypeModel model});
}

/// @nodoc
class __$$FleetTypeStateSuccessCopyWithImpl<$Res>
    extends _$FleetTypeStateCopyWithImpl<$Res, _$FleetTypeStateSuccess>
    implements _$$FleetTypeStateSuccessCopyWith<$Res> {
  __$$FleetTypeStateSuccessCopyWithImpl(_$FleetTypeStateSuccess _value,
      $Res Function(_$FleetTypeStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$FleetTypeStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as FleetTypeModel,
    ));
  }
}

/// @nodoc

class _$FleetTypeStateSuccess implements FleetTypeStateSuccess {
  const _$FleetTypeStateSuccess({required this.model});

  @override
  final FleetTypeModel model;

  @override
  String toString() {
    return 'FleetTypeState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FleetTypeStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FleetTypeStateSuccessCopyWith<_$FleetTypeStateSuccess> get copyWith =>
      __$$FleetTypeStateSuccessCopyWithImpl<_$FleetTypeStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FleetTypeModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FleetTypeModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FleetTypeModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FleetTypeStateInitial value) initial,
    required TResult Function(FleetTypeStateLoading value) loading,
    required TResult Function(FleetTypeStateSuccess value) success,
    required TResult Function(FleetTypeStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FleetTypeStateInitial value)? initial,
    TResult? Function(FleetTypeStateLoading value)? loading,
    TResult? Function(FleetTypeStateSuccess value)? success,
    TResult? Function(FleetTypeStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FleetTypeStateInitial value)? initial,
    TResult Function(FleetTypeStateLoading value)? loading,
    TResult Function(FleetTypeStateSuccess value)? success,
    TResult Function(FleetTypeStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FleetTypeStateSuccess implements FleetTypeState {
  const factory FleetTypeStateSuccess({required final FleetTypeModel model}) =
      _$FleetTypeStateSuccess;

  FleetTypeModel get model;
  @JsonKey(ignore: true)
  _$$FleetTypeStateSuccessCopyWith<_$FleetTypeStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FleetTypeStateErrorCopyWith<$Res> {
  factory _$$FleetTypeStateErrorCopyWith(_$FleetTypeStateError value,
          $Res Function(_$FleetTypeStateError) then) =
      __$$FleetTypeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$FleetTypeStateErrorCopyWithImpl<$Res>
    extends _$FleetTypeStateCopyWithImpl<$Res, _$FleetTypeStateError>
    implements _$$FleetTypeStateErrorCopyWith<$Res> {
  __$$FleetTypeStateErrorCopyWithImpl(
      _$FleetTypeStateError _value, $Res Function(_$FleetTypeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FleetTypeStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as KFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $KFailureCopyWith<$Res> get error {
    return $KFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$FleetTypeStateError implements FleetTypeStateError {
  const _$FleetTypeStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'FleetTypeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FleetTypeStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FleetTypeStateErrorCopyWith<_$FleetTypeStateError> get copyWith =>
      __$$FleetTypeStateErrorCopyWithImpl<_$FleetTypeStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FleetTypeModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FleetTypeModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FleetTypeModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FleetTypeStateInitial value) initial,
    required TResult Function(FleetTypeStateLoading value) loading,
    required TResult Function(FleetTypeStateSuccess value) success,
    required TResult Function(FleetTypeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FleetTypeStateInitial value)? initial,
    TResult? Function(FleetTypeStateLoading value)? loading,
    TResult? Function(FleetTypeStateSuccess value)? success,
    TResult? Function(FleetTypeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FleetTypeStateInitial value)? initial,
    TResult Function(FleetTypeStateLoading value)? loading,
    TResult Function(FleetTypeStateSuccess value)? success,
    TResult Function(FleetTypeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FleetTypeStateError implements FleetTypeState {
  const factory FleetTypeStateError({required final KFailure error}) =
      _$FleetTypeStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$FleetTypeStateErrorCopyWith<_$FleetTypeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
