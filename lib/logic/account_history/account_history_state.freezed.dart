// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountData model) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountData model)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountData model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountHistoryStateInitial value) initial,
    required TResult Function(AccountHistoryStateLoading value) loading,
    required TResult Function(AccountHistoryStateSuccess value) success,
    required TResult Function(AccountHistoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountHistoryStateInitial value)? initial,
    TResult? Function(AccountHistoryStateLoading value)? loading,
    TResult? Function(AccountHistoryStateSuccess value)? success,
    TResult? Function(AccountHistoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountHistoryStateInitial value)? initial,
    TResult Function(AccountHistoryStateLoading value)? loading,
    TResult Function(AccountHistoryStateSuccess value)? success,
    TResult Function(AccountHistoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountHistoryStateCopyWith<$Res> {
  factory $AccountHistoryStateCopyWith(
          AccountHistoryState value, $Res Function(AccountHistoryState) then) =
      _$AccountHistoryStateCopyWithImpl<$Res, AccountHistoryState>;
}

/// @nodoc
class _$AccountHistoryStateCopyWithImpl<$Res, $Val extends AccountHistoryState>
    implements $AccountHistoryStateCopyWith<$Res> {
  _$AccountHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountHistoryStateInitialCopyWith<$Res> {
  factory _$$AccountHistoryStateInitialCopyWith(
          _$AccountHistoryStateInitial value,
          $Res Function(_$AccountHistoryStateInitial) then) =
      __$$AccountHistoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountHistoryStateInitialCopyWithImpl<$Res>
    extends _$AccountHistoryStateCopyWithImpl<$Res,
        _$AccountHistoryStateInitial>
    implements _$$AccountHistoryStateInitialCopyWith<$Res> {
  __$$AccountHistoryStateInitialCopyWithImpl(
      _$AccountHistoryStateInitial _value,
      $Res Function(_$AccountHistoryStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountHistoryStateInitial implements AccountHistoryStateInitial {
  const _$AccountHistoryStateInitial();

  @override
  String toString() {
    return 'AccountHistoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHistoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountData model)? success,
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
    required TResult Function(AccountHistoryStateInitial value) initial,
    required TResult Function(AccountHistoryStateLoading value) loading,
    required TResult Function(AccountHistoryStateSuccess value) success,
    required TResult Function(AccountHistoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountHistoryStateInitial value)? initial,
    TResult? Function(AccountHistoryStateLoading value)? loading,
    TResult? Function(AccountHistoryStateSuccess value)? success,
    TResult? Function(AccountHistoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountHistoryStateInitial value)? initial,
    TResult Function(AccountHistoryStateLoading value)? loading,
    TResult Function(AccountHistoryStateSuccess value)? success,
    TResult Function(AccountHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AccountHistoryStateInitial implements AccountHistoryState {
  const factory AccountHistoryStateInitial() = _$AccountHistoryStateInitial;
}

/// @nodoc
abstract class _$$AccountHistoryStateLoadingCopyWith<$Res> {
  factory _$$AccountHistoryStateLoadingCopyWith(
          _$AccountHistoryStateLoading value,
          $Res Function(_$AccountHistoryStateLoading) then) =
      __$$AccountHistoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountHistoryStateLoadingCopyWithImpl<$Res>
    extends _$AccountHistoryStateCopyWithImpl<$Res,
        _$AccountHistoryStateLoading>
    implements _$$AccountHistoryStateLoadingCopyWith<$Res> {
  __$$AccountHistoryStateLoadingCopyWithImpl(
      _$AccountHistoryStateLoading _value,
      $Res Function(_$AccountHistoryStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountHistoryStateLoading implements AccountHistoryStateLoading {
  const _$AccountHistoryStateLoading();

  @override
  String toString() {
    return 'AccountHistoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHistoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountData model)? success,
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
    required TResult Function(AccountHistoryStateInitial value) initial,
    required TResult Function(AccountHistoryStateLoading value) loading,
    required TResult Function(AccountHistoryStateSuccess value) success,
    required TResult Function(AccountHistoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountHistoryStateInitial value)? initial,
    TResult? Function(AccountHistoryStateLoading value)? loading,
    TResult? Function(AccountHistoryStateSuccess value)? success,
    TResult? Function(AccountHistoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountHistoryStateInitial value)? initial,
    TResult Function(AccountHistoryStateLoading value)? loading,
    TResult Function(AccountHistoryStateSuccess value)? success,
    TResult Function(AccountHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AccountHistoryStateLoading implements AccountHistoryState {
  const factory AccountHistoryStateLoading() = _$AccountHistoryStateLoading;
}

/// @nodoc
abstract class _$$AccountHistoryStateSuccessCopyWith<$Res> {
  factory _$$AccountHistoryStateSuccessCopyWith(
          _$AccountHistoryStateSuccess value,
          $Res Function(_$AccountHistoryStateSuccess) then) =
      __$$AccountHistoryStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountData model});
}

/// @nodoc
class __$$AccountHistoryStateSuccessCopyWithImpl<$Res>
    extends _$AccountHistoryStateCopyWithImpl<$Res,
        _$AccountHistoryStateSuccess>
    implements _$$AccountHistoryStateSuccessCopyWith<$Res> {
  __$$AccountHistoryStateSuccessCopyWithImpl(
      _$AccountHistoryStateSuccess _value,
      $Res Function(_$AccountHistoryStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$AccountHistoryStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AccountData,
    ));
  }
}

/// @nodoc

class _$AccountHistoryStateSuccess implements AccountHistoryStateSuccess {
  const _$AccountHistoryStateSuccess({required this.model});

  @override
  final AccountData model;

  @override
  String toString() {
    return 'AccountHistoryState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHistoryStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountHistoryStateSuccessCopyWith<_$AccountHistoryStateSuccess>
      get copyWith => __$$AccountHistoryStateSuccessCopyWithImpl<
          _$AccountHistoryStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountData model)? success,
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
    required TResult Function(AccountHistoryStateInitial value) initial,
    required TResult Function(AccountHistoryStateLoading value) loading,
    required TResult Function(AccountHistoryStateSuccess value) success,
    required TResult Function(AccountHistoryStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountHistoryStateInitial value)? initial,
    TResult? Function(AccountHistoryStateLoading value)? loading,
    TResult? Function(AccountHistoryStateSuccess value)? success,
    TResult? Function(AccountHistoryStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountHistoryStateInitial value)? initial,
    TResult Function(AccountHistoryStateLoading value)? loading,
    TResult Function(AccountHistoryStateSuccess value)? success,
    TResult Function(AccountHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AccountHistoryStateSuccess implements AccountHistoryState {
  const factory AccountHistoryStateSuccess({required final AccountData model}) =
      _$AccountHistoryStateSuccess;

  AccountData get model;
  @JsonKey(ignore: true)
  _$$AccountHistoryStateSuccessCopyWith<_$AccountHistoryStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountHistoryStateErrorCopyWith<$Res> {
  factory _$$AccountHistoryStateErrorCopyWith(_$AccountHistoryStateError value,
          $Res Function(_$AccountHistoryStateError) then) =
      __$$AccountHistoryStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$AccountHistoryStateErrorCopyWithImpl<$Res>
    extends _$AccountHistoryStateCopyWithImpl<$Res, _$AccountHistoryStateError>
    implements _$$AccountHistoryStateErrorCopyWith<$Res> {
  __$$AccountHistoryStateErrorCopyWithImpl(_$AccountHistoryStateError _value,
      $Res Function(_$AccountHistoryStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AccountHistoryStateError(
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

class _$AccountHistoryStateError implements AccountHistoryStateError {
  const _$AccountHistoryStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'AccountHistoryState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHistoryStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountHistoryStateErrorCopyWith<_$AccountHistoryStateError>
      get copyWith =>
          __$$AccountHistoryStateErrorCopyWithImpl<_$AccountHistoryStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountData model)? success,
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
    required TResult Function(AccountHistoryStateInitial value) initial,
    required TResult Function(AccountHistoryStateLoading value) loading,
    required TResult Function(AccountHistoryStateSuccess value) success,
    required TResult Function(AccountHistoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountHistoryStateInitial value)? initial,
    TResult? Function(AccountHistoryStateLoading value)? loading,
    TResult? Function(AccountHistoryStateSuccess value)? success,
    TResult? Function(AccountHistoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountHistoryStateInitial value)? initial,
    TResult Function(AccountHistoryStateLoading value)? loading,
    TResult Function(AccountHistoryStateSuccess value)? success,
    TResult Function(AccountHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AccountHistoryStateError implements AccountHistoryState {
  const factory AccountHistoryStateError({required final KFailure error}) =
      _$AccountHistoryStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$AccountHistoryStateErrorCopyWith<_$AccountHistoryStateError>
      get copyWith => throw _privateConstructorUsedError;
}
