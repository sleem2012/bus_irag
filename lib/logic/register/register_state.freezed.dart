// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel model) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel model)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterStateInitial value) initial,
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateSuccess value) success,
    required TResult Function(RegisterStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterStateInitial value)? initial,
    TResult? Function(RegisterStateLoading value)? loading,
    TResult? Function(RegisterStateSuccess value)? success,
    TResult? Function(RegisterStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateInitial value)? initial,
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateSuccess value)? success,
    TResult Function(RegisterStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterStateInitialCopyWith<$Res> {
  factory _$$RegisterStateInitialCopyWith(_$RegisterStateInitial value,
          $Res Function(_$RegisterStateInitial) then) =
      __$$RegisterStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterStateInitialCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateInitial>
    implements _$$RegisterStateInitialCopyWith<$Res> {
  __$$RegisterStateInitialCopyWithImpl(_$RegisterStateInitial _value,
      $Res Function(_$RegisterStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterStateInitial implements RegisterStateInitial {
  const _$RegisterStateInitial();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel model)? success,
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
    required TResult Function(RegisterStateInitial value) initial,
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateSuccess value) success,
    required TResult Function(RegisterStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterStateInitial value)? initial,
    TResult? Function(RegisterStateLoading value)? loading,
    TResult? Function(RegisterStateSuccess value)? success,
    TResult? Function(RegisterStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateInitial value)? initial,
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateSuccess value)? success,
    TResult Function(RegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RegisterStateInitial implements RegisterState {
  const factory RegisterStateInitial() = _$RegisterStateInitial;
}

/// @nodoc
abstract class _$$RegisterStateLoadingCopyWith<$Res> {
  factory _$$RegisterStateLoadingCopyWith(_$RegisterStateLoading value,
          $Res Function(_$RegisterStateLoading) then) =
      __$$RegisterStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterStateLoadingCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateLoading>
    implements _$$RegisterStateLoadingCopyWith<$Res> {
  __$$RegisterStateLoadingCopyWithImpl(_$RegisterStateLoading _value,
      $Res Function(_$RegisterStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterStateLoading implements RegisterStateLoading {
  const _$RegisterStateLoading();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel model)? success,
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
    required TResult Function(RegisterStateInitial value) initial,
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateSuccess value) success,
    required TResult Function(RegisterStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterStateInitial value)? initial,
    TResult? Function(RegisterStateLoading value)? loading,
    TResult? Function(RegisterStateSuccess value)? success,
    TResult? Function(RegisterStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateInitial value)? initial,
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateSuccess value)? success,
    TResult Function(RegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterStateLoading implements RegisterState {
  const factory RegisterStateLoading() = _$RegisterStateLoading;
}

/// @nodoc
abstract class _$$RegisterStateSuccessCopyWith<$Res> {
  factory _$$RegisterStateSuccessCopyWith(_$RegisterStateSuccess value,
          $Res Function(_$RegisterStateSuccess) then) =
      __$$RegisterStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel model});
}

/// @nodoc
class __$$RegisterStateSuccessCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateSuccess>
    implements _$$RegisterStateSuccessCopyWith<$Res> {
  __$$RegisterStateSuccessCopyWithImpl(_$RegisterStateSuccess _value,
      $Res Function(_$RegisterStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$RegisterStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$RegisterStateSuccess implements RegisterStateSuccess {
  const _$RegisterStateSuccess({required this.model});

  @override
  final UserModel model;

  @override
  String toString() {
    return 'RegisterState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateSuccessCopyWith<_$RegisterStateSuccess> get copyWith =>
      __$$RegisterStateSuccessCopyWithImpl<_$RegisterStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel model)? success,
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
    required TResult Function(RegisterStateInitial value) initial,
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateSuccess value) success,
    required TResult Function(RegisterStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterStateInitial value)? initial,
    TResult? Function(RegisterStateLoading value)? loading,
    TResult? Function(RegisterStateSuccess value)? success,
    TResult? Function(RegisterStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateInitial value)? initial,
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateSuccess value)? success,
    TResult Function(RegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RegisterStateSuccess implements RegisterState {
  const factory RegisterStateSuccess({required final UserModel model}) =
      _$RegisterStateSuccess;

  UserModel get model;
  @JsonKey(ignore: true)
  _$$RegisterStateSuccessCopyWith<_$RegisterStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterStateErrorCopyWith<$Res> {
  factory _$$RegisterStateErrorCopyWith(_$RegisterStateError value,
          $Res Function(_$RegisterStateError) then) =
      __$$RegisterStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$RegisterStateErrorCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateError>
    implements _$$RegisterStateErrorCopyWith<$Res> {
  __$$RegisterStateErrorCopyWithImpl(
      _$RegisterStateError _value, $Res Function(_$RegisterStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RegisterStateError(
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

class _$RegisterStateError implements RegisterStateError {
  const _$RegisterStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'RegisterState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateErrorCopyWith<_$RegisterStateError> get copyWith =>
      __$$RegisterStateErrorCopyWithImpl<_$RegisterStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel model) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel model)? success,
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
    required TResult Function(RegisterStateInitial value) initial,
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateSuccess value) success,
    required TResult Function(RegisterStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterStateInitial value)? initial,
    TResult? Function(RegisterStateLoading value)? loading,
    TResult? Function(RegisterStateSuccess value)? success,
    TResult? Function(RegisterStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateInitial value)? initial,
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateSuccess value)? success,
    TResult Function(RegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegisterStateError implements RegisterState {
  const factory RegisterStateError({required final KFailure error}) =
      _$RegisterStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$RegisterStateErrorCopyWith<_$RegisterStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
