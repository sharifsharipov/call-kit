// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_conversations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchConversationsParams {

 String get userId;
/// Create a copy of WatchConversationsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchConversationsParamsCopyWith<WatchConversationsParams> get copyWith => _$WatchConversationsParamsCopyWithImpl<WatchConversationsParams>(this as WatchConversationsParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchConversationsParams&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WatchConversationsParams(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $WatchConversationsParamsCopyWith<$Res>  {
  factory $WatchConversationsParamsCopyWith(WatchConversationsParams value, $Res Function(WatchConversationsParams) _then) = _$WatchConversationsParamsCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$WatchConversationsParamsCopyWithImpl<$Res>
    implements $WatchConversationsParamsCopyWith<$Res> {
  _$WatchConversationsParamsCopyWithImpl(this._self, this._then);

  final WatchConversationsParams _self;
  final $Res Function(WatchConversationsParams) _then;

/// Create a copy of WatchConversationsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(WatchConversationsParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchConversationsParams].
extension WatchConversationsParamsPatterns on WatchConversationsParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchConversationsParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchConversationsParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchConversationsParams value)  $default,){
final _that = this;
switch (_that) {
case _WatchConversationsParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchConversationsParams value)?  $default,){
final _that = this;
switch (_that) {
case _WatchConversationsParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchConversationsParams() when $default != null:
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId)  $default,) {final _that = this;
switch (_that) {
case _WatchConversationsParams():
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId)?  $default,) {final _that = this;
switch (_that) {
case _WatchConversationsParams() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _WatchConversationsParams implements WatchConversationsParams {
  const _WatchConversationsParams({required this.userId});
  

@override final  String userId;

/// Create a copy of WatchConversationsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchConversationsParamsCopyWith<_WatchConversationsParams> get copyWith => __$WatchConversationsParamsCopyWithImpl<_WatchConversationsParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchConversationsParams&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WatchConversationsParams(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$WatchConversationsParamsCopyWith<$Res> implements $WatchConversationsParamsCopyWith<$Res> {
  factory _$WatchConversationsParamsCopyWith(_WatchConversationsParams value, $Res Function(_WatchConversationsParams) _then) = __$WatchConversationsParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$WatchConversationsParamsCopyWithImpl<$Res>
    implements _$WatchConversationsParamsCopyWith<$Res> {
  __$WatchConversationsParamsCopyWithImpl(this._self, this._then);

  final _WatchConversationsParams _self;
  final $Res Function(_WatchConversationsParams) _then;

/// Create a copy of WatchConversationsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_WatchConversationsParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
