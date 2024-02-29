// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BannerModel model) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BannerModel model)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BannerModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BannerStateInitial value) initial,
    required TResult Function(BannerStateLoading value) loading,
    required TResult Function(BannerStateSuccess value) success,
    required TResult Function(BannerStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerStateInitial value)? initial,
    TResult? Function(BannerStateLoading value)? loading,
    TResult? Function(BannerStateSuccess value)? success,
    TResult? Function(BannerStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerStateInitial value)? initial,
    TResult Function(BannerStateLoading value)? loading,
    TResult Function(BannerStateSuccess value)? success,
    TResult Function(BannerStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BannerStateInitialCopyWith<$Res> {
  factory _$$BannerStateInitialCopyWith(_$BannerStateInitial value,
          $Res Function(_$BannerStateInitial) then) =
      __$$BannerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BannerStateInitialCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateInitial>
    implements _$$BannerStateInitialCopyWith<$Res> {
  __$$BannerStateInitialCopyWithImpl(
      _$BannerStateInitial _value, $Res Function(_$BannerStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BannerStateInitial implements BannerStateInitial {
  const _$BannerStateInitial();

  @override
  String toString() {
    return 'BannerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BannerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BannerModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BannerModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BannerModel model)? success,
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
    required TResult Function(BannerStateInitial value) initial,
    required TResult Function(BannerStateLoading value) loading,
    required TResult Function(BannerStateSuccess value) success,
    required TResult Function(BannerStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerStateInitial value)? initial,
    TResult? Function(BannerStateLoading value)? loading,
    TResult? Function(BannerStateSuccess value)? success,
    TResult? Function(BannerStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerStateInitial value)? initial,
    TResult Function(BannerStateLoading value)? loading,
    TResult Function(BannerStateSuccess value)? success,
    TResult Function(BannerStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BannerStateInitial implements BannerState {
  const factory BannerStateInitial() = _$BannerStateInitial;
}

/// @nodoc
abstract class _$$BannerStateLoadingCopyWith<$Res> {
  factory _$$BannerStateLoadingCopyWith(_$BannerStateLoading value,
          $Res Function(_$BannerStateLoading) then) =
      __$$BannerStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BannerStateLoadingCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateLoading>
    implements _$$BannerStateLoadingCopyWith<$Res> {
  __$$BannerStateLoadingCopyWithImpl(
      _$BannerStateLoading _value, $Res Function(_$BannerStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BannerStateLoading implements BannerStateLoading {
  const _$BannerStateLoading();

  @override
  String toString() {
    return 'BannerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BannerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BannerModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BannerModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BannerModel model)? success,
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
    required TResult Function(BannerStateInitial value) initial,
    required TResult Function(BannerStateLoading value) loading,
    required TResult Function(BannerStateSuccess value) success,
    required TResult Function(BannerStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerStateInitial value)? initial,
    TResult? Function(BannerStateLoading value)? loading,
    TResult? Function(BannerStateSuccess value)? success,
    TResult? Function(BannerStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerStateInitial value)? initial,
    TResult Function(BannerStateLoading value)? loading,
    TResult Function(BannerStateSuccess value)? success,
    TResult Function(BannerStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BannerStateLoading implements BannerState {
  const factory BannerStateLoading() = _$BannerStateLoading;
}

/// @nodoc
abstract class _$$BannerStateSuccessCopyWith<$Res> {
  factory _$$BannerStateSuccessCopyWith(_$BannerStateSuccess value,
          $Res Function(_$BannerStateSuccess) then) =
      __$$BannerStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({BannerModel model});
}

/// @nodoc
class __$$BannerStateSuccessCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateSuccess>
    implements _$$BannerStateSuccessCopyWith<$Res> {
  __$$BannerStateSuccessCopyWithImpl(
      _$BannerStateSuccess _value, $Res Function(_$BannerStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$BannerStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as BannerModel,
    ));
  }
}

/// @nodoc

class _$BannerStateSuccess implements BannerStateSuccess {
  const _$BannerStateSuccess({required this.model});

  @override
  final BannerModel model;

  @override
  String toString() {
    return 'BannerState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateSuccessCopyWith<_$BannerStateSuccess> get copyWith =>
      __$$BannerStateSuccessCopyWithImpl<_$BannerStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BannerModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BannerModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BannerModel model)? success,
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
    required TResult Function(BannerStateInitial value) initial,
    required TResult Function(BannerStateLoading value) loading,
    required TResult Function(BannerStateSuccess value) success,
    required TResult Function(BannerStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerStateInitial value)? initial,
    TResult? Function(BannerStateLoading value)? loading,
    TResult? Function(BannerStateSuccess value)? success,
    TResult? Function(BannerStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerStateInitial value)? initial,
    TResult Function(BannerStateLoading value)? loading,
    TResult Function(BannerStateSuccess value)? success,
    TResult Function(BannerStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BannerStateSuccess implements BannerState {
  const factory BannerStateSuccess({required final BannerModel model}) =
      _$BannerStateSuccess;

  BannerModel get model;
  @JsonKey(ignore: true)
  _$$BannerStateSuccessCopyWith<_$BannerStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannerStateErrorCopyWith<$Res> {
  factory _$$BannerStateErrorCopyWith(
          _$BannerStateError value, $Res Function(_$BannerStateError) then) =
      __$$BannerStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$BannerStateErrorCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateError>
    implements _$$BannerStateErrorCopyWith<$Res> {
  __$$BannerStateErrorCopyWithImpl(
      _$BannerStateError _value, $Res Function(_$BannerStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BannerStateError(
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

class _$BannerStateError implements BannerStateError {
  const _$BannerStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'BannerState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateErrorCopyWith<_$BannerStateError> get copyWith =>
      __$$BannerStateErrorCopyWithImpl<_$BannerStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BannerModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BannerModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BannerModel model)? success,
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
    required TResult Function(BannerStateInitial value) initial,
    required TResult Function(BannerStateLoading value) loading,
    required TResult Function(BannerStateSuccess value) success,
    required TResult Function(BannerStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerStateInitial value)? initial,
    TResult? Function(BannerStateLoading value)? loading,
    TResult? Function(BannerStateSuccess value)? success,
    TResult? Function(BannerStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerStateInitial value)? initial,
    TResult Function(BannerStateLoading value)? loading,
    TResult Function(BannerStateSuccess value)? success,
    TResult Function(BannerStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BannerStateError implements BannerState {
  const factory BannerStateError({required final KFailure error}) =
      _$BannerStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$BannerStateErrorCopyWith<_$BannerStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
