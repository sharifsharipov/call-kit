// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_launcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CallLauncherState {

 CallLauncherStatus get status; String? get callId; Failure? get failure;
/// Create a copy of CallLauncherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallLauncherStateCopyWith<CallLauncherState> get copyWith => _$CallLauncherStateCopyWithImpl<CallLauncherState>(this as CallLauncherState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallLauncherState&&(identical(other.status, status) || other.status == status)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,callId,failure);

@override
String toString() {
  return 'CallLauncherState(status: $status, callId: $callId, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CallLauncherStateCopyWith<$Res>  {
  factory $CallLauncherStateCopyWith(CallLauncherState value, $Res Function(CallLauncherState) _then) = _$CallLauncherStateCopyWithImpl;
@useResult
$Res call({
 CallLauncherStatus status, String? callId, Failure? failure
});




}
/// @nodoc
class _$CallLauncherStateCopyWithImpl<$Res>
    implements $CallLauncherStateCopyWith<$Res> {
  _$CallLauncherStateCopyWithImpl(this._self, this._then);

  final CallLauncherState _self;
  final $Res Function(CallLauncherState) _then;

/// Create a copy of CallLauncherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? callId = freezed,Object? failure = freezed,}) {
  return _then(CallLauncherState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallLauncherStatus,callId: freezed == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [CallLauncherState].
extension CallLauncherStatePatterns on CallLauncherState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallLauncherState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallLauncherState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallLauncherState value)  $default,){
final _that = this;
switch (_that) {
case _CallLauncherState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallLauncherState value)?  $default,){
final _that = this;
switch (_that) {
case _CallLauncherState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CallLauncherStatus status,  String? callId,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallLauncherState() when $default != null:
return $default(_that.status,_that.callId,_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CallLauncherStatus status,  String? callId,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _CallLauncherState():
return $default(_that.status,_that.callId,_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CallLauncherStatus status,  String? callId,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _CallLauncherState() when $default != null:
return $default(_that.status,_that.callId,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CallLauncherState implements CallLauncherState {
  const _CallLauncherState({this.status = CallLauncherStatus.idle, this.callId, this.failure});
  

@override@JsonKey() final  CallLauncherStatus status;
@override final  String? callId;
@override final  Failure? failure;

/// Create a copy of CallLauncherState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallLauncherStateCopyWith<_CallLauncherState> get copyWith => __$CallLauncherStateCopyWithImpl<_CallLauncherState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallLauncherState&&(identical(other.status, status) || other.status == status)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,callId,failure);

@override
String toString() {
  return 'CallLauncherState(status: $status, callId: $callId, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CallLauncherStateCopyWith<$Res> implements $CallLauncherStateCopyWith<$Res> {
  factory _$CallLauncherStateCopyWith(_CallLauncherState value, $Res Function(_CallLauncherState) _then) = __$CallLauncherStateCopyWithImpl;
@override @useResult
$Res call({
 CallLauncherStatus status, String? callId, Failure? failure
});




}
/// @nodoc
class __$CallLauncherStateCopyWithImpl<$Res>
    implements _$CallLauncherStateCopyWith<$Res> {
  __$CallLauncherStateCopyWithImpl(this._self, this._then);

  final _CallLauncherState _self;
  final $Res Function(_CallLauncherState) _then;

/// Create a copy of CallLauncherState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? callId = freezed,Object? failure = freezed,}) {
  return _then(_CallLauncherState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallLauncherStatus,callId: freezed == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
