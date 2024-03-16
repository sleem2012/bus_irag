// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_ticket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetTicketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TicketData model) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TicketData model)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TicketData model)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTicketStateInitial value) initial,
    required TResult Function(GetTicketStateLoading value) loading,
    required TResult Function(GetTicketStateSuccess value) success,
    required TResult Function(GetTicketStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTicketStateInitial value)? initial,
    TResult? Function(GetTicketStateLoading value)? loading,
    TResult? Function(GetTicketStateSuccess value)? success,
    TResult? Function(GetTicketStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTicketStateInitial value)? initial,
    TResult Function(GetTicketStateLoading value)? loading,
    TResult Function(GetTicketStateSuccess value)? success,
    TResult Function(GetTicketStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTicketStateCopyWith<$Res> {
  factory $GetTicketStateCopyWith(
          GetTicketState value, $Res Function(GetTicketState) then) =
      _$GetTicketStateCopyWithImpl<$Res, GetTicketState>;
}

/// @nodoc
class _$GetTicketStateCopyWithImpl<$Res, $Val extends GetTicketState>
    implements $GetTicketStateCopyWith<$Res> {
  _$GetTicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetTicketStateInitialCopyWith<$Res> {
  factory _$$GetTicketStateInitialCopyWith(_$GetTicketStateInitial value,
          $Res Function(_$GetTicketStateInitial) then) =
      __$$GetTicketStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTicketStateInitialCopyWithImpl<$Res>
    extends _$GetTicketStateCopyWithImpl<$Res, _$GetTicketStateInitial>
    implements _$$GetTicketStateInitialCopyWith<$Res> {
  __$$GetTicketStateInitialCopyWithImpl(_$GetTicketStateInitial _value,
      $Res Function(_$GetTicketStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTicketStateInitial implements GetTicketStateInitial {
  const _$GetTicketStateInitial();

  @override
  String toString() {
    return 'GetTicketState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTicketStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TicketData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TicketData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TicketData model)? success,
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
    required TResult Function(GetTicketStateInitial value) initial,
    required TResult Function(GetTicketStateLoading value) loading,
    required TResult Function(GetTicketStateSuccess value) success,
    required TResult Function(GetTicketStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTicketStateInitial value)? initial,
    TResult? Function(GetTicketStateLoading value)? loading,
    TResult? Function(GetTicketStateSuccess value)? success,
    TResult? Function(GetTicketStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTicketStateInitial value)? initial,
    TResult Function(GetTicketStateLoading value)? loading,
    TResult Function(GetTicketStateSuccess value)? success,
    TResult Function(GetTicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetTicketStateInitial implements GetTicketState {
  const factory GetTicketStateInitial() = _$GetTicketStateInitial;
}

/// @nodoc
abstract class _$$GetTicketStateLoadingCopyWith<$Res> {
  factory _$$GetTicketStateLoadingCopyWith(_$GetTicketStateLoading value,
          $Res Function(_$GetTicketStateLoading) then) =
      __$$GetTicketStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTicketStateLoadingCopyWithImpl<$Res>
    extends _$GetTicketStateCopyWithImpl<$Res, _$GetTicketStateLoading>
    implements _$$GetTicketStateLoadingCopyWith<$Res> {
  __$$GetTicketStateLoadingCopyWithImpl(_$GetTicketStateLoading _value,
      $Res Function(_$GetTicketStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTicketStateLoading implements GetTicketStateLoading {
  const _$GetTicketStateLoading();

  @override
  String toString() {
    return 'GetTicketState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTicketStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TicketData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TicketData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TicketData model)? success,
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
    required TResult Function(GetTicketStateInitial value) initial,
    required TResult Function(GetTicketStateLoading value) loading,
    required TResult Function(GetTicketStateSuccess value) success,
    required TResult Function(GetTicketStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTicketStateInitial value)? initial,
    TResult? Function(GetTicketStateLoading value)? loading,
    TResult? Function(GetTicketStateSuccess value)? success,
    TResult? Function(GetTicketStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTicketStateInitial value)? initial,
    TResult Function(GetTicketStateLoading value)? loading,
    TResult Function(GetTicketStateSuccess value)? success,
    TResult Function(GetTicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetTicketStateLoading implements GetTicketState {
  const factory GetTicketStateLoading() = _$GetTicketStateLoading;
}

/// @nodoc
abstract class _$$GetTicketStateSuccessCopyWith<$Res> {
  factory _$$GetTicketStateSuccessCopyWith(_$GetTicketStateSuccess value,
          $Res Function(_$GetTicketStateSuccess) then) =
      __$$GetTicketStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({TicketData model});
}

/// @nodoc
class __$$GetTicketStateSuccessCopyWithImpl<$Res>
    extends _$GetTicketStateCopyWithImpl<$Res, _$GetTicketStateSuccess>
    implements _$$GetTicketStateSuccessCopyWith<$Res> {
  __$$GetTicketStateSuccessCopyWithImpl(_$GetTicketStateSuccess _value,
      $Res Function(_$GetTicketStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$GetTicketStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TicketData,
    ));
  }
}

/// @nodoc

class _$GetTicketStateSuccess implements GetTicketStateSuccess {
  const _$GetTicketStateSuccess({required this.model});

  @override
  final TicketData model;

  @override
  String toString() {
    return 'GetTicketState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTicketStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTicketStateSuccessCopyWith<_$GetTicketStateSuccess> get copyWith =>
      __$$GetTicketStateSuccessCopyWithImpl<_$GetTicketStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TicketData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TicketData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TicketData model)? success,
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
    required TResult Function(GetTicketStateInitial value) initial,
    required TResult Function(GetTicketStateLoading value) loading,
    required TResult Function(GetTicketStateSuccess value) success,
    required TResult Function(GetTicketStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTicketStateInitial value)? initial,
    TResult? Function(GetTicketStateLoading value)? loading,
    TResult? Function(GetTicketStateSuccess value)? success,
    TResult? Function(GetTicketStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTicketStateInitial value)? initial,
    TResult Function(GetTicketStateLoading value)? loading,
    TResult Function(GetTicketStateSuccess value)? success,
    TResult Function(GetTicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetTicketStateSuccess implements GetTicketState {
  const factory GetTicketStateSuccess({required final TicketData model}) =
      _$GetTicketStateSuccess;

  TicketData get model;
  @JsonKey(ignore: true)
  _$$GetTicketStateSuccessCopyWith<_$GetTicketStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTicketStateErrorCopyWith<$Res> {
  factory _$$GetTicketStateErrorCopyWith(_$GetTicketStateError value,
          $Res Function(_$GetTicketStateError) then) =
      __$$GetTicketStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$GetTicketStateErrorCopyWithImpl<$Res>
    extends _$GetTicketStateCopyWithImpl<$Res, _$GetTicketStateError>
    implements _$$GetTicketStateErrorCopyWith<$Res> {
  __$$GetTicketStateErrorCopyWithImpl(
      _$GetTicketStateError _value, $Res Function(_$GetTicketStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetTicketStateError(
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

class _$GetTicketStateError implements GetTicketStateError {
  const _$GetTicketStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'GetTicketState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTicketStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTicketStateErrorCopyWith<_$GetTicketStateError> get copyWith =>
      __$$GetTicketStateErrorCopyWithImpl<_$GetTicketStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TicketData model) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TicketData model)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TicketData model)? success,
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
    required TResult Function(GetTicketStateInitial value) initial,
    required TResult Function(GetTicketStateLoading value) loading,
    required TResult Function(GetTicketStateSuccess value) success,
    required TResult Function(GetTicketStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTicketStateInitial value)? initial,
    TResult? Function(GetTicketStateLoading value)? loading,
    TResult? Function(GetTicketStateSuccess value)? success,
    TResult? Function(GetTicketStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTicketStateInitial value)? initial,
    TResult Function(GetTicketStateLoading value)? loading,
    TResult Function(GetTicketStateSuccess value)? success,
    TResult Function(GetTicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetTicketStateError implements GetTicketState {
  const factory GetTicketStateError({required final KFailure error}) =
      _$GetTicketStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$GetTicketStateErrorCopyWith<_$GetTicketStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
