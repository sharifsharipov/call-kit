// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchMessagesParams {

 String get conversationId;
/// Create a copy of WatchMessagesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchMessagesParamsCopyWith<WatchMessagesParams> get copyWith => _$WatchMessagesParamsCopyWithImpl<WatchMessagesParams>(this as WatchMessagesParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchMessagesParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'WatchMessagesParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $WatchMessagesParamsCopyWith<$Res>  {
  factory $WatchMessagesParamsCopyWith(WatchMessagesParams value, $Res Function(WatchMessagesParams) _then) = _$WatchMessagesParamsCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$WatchMessagesParamsCopyWithImpl<$Res>
    implements $WatchMessagesParamsCopyWith<$Res> {
  _$WatchMessagesParamsCopyWithImpl(this._self, this._then);

  final WatchMessagesParams _self;
  final $Res Function(WatchMessagesParams) _then;

/// Create a copy of WatchMessagesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,}) {
  return _then(WatchMessagesParams(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchMessagesParams].
extension WatchMessagesParamsPatterns on WatchMessagesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchMessagesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchMessagesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchMessagesParams value)  $default,){
final _that = this;
switch (_that) {
case _WatchMessagesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchMessagesParams value)?  $default,){
final _that = this;
switch (_that) {
case _WatchMessagesParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchMessagesParams() when $default != null:
return $default(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId)  $default,) {final _that = this;
switch (_that) {
case _WatchMessagesParams():
return $default(_that.conversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId)?  $default,) {final _that = this;
switch (_that) {
case _WatchMessagesParams() when $default != null:
return $default(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc


class _WatchMessagesParams implements WatchMessagesParams {
  const _WatchMessagesParams({required this.conversationId});
  

@override final  String conversationId;

/// Create a copy of WatchMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchMessagesParamsCopyWith<_WatchMessagesParams> get copyWith => __$WatchMessagesParamsCopyWithImpl<_WatchMessagesParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchMessagesParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'WatchMessagesParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$WatchMessagesParamsCopyWith<$Res> implements $WatchMessagesParamsCopyWith<$Res> {
  factory _$WatchMessagesParamsCopyWith(_WatchMessagesParams value, $Res Function(_WatchMessagesParams) _then) = __$WatchMessagesParamsCopyWithImpl;
@override @useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$WatchMessagesParamsCopyWithImpl<$Res>
    implements _$WatchMessagesParamsCopyWith<$Res> {
  __$WatchMessagesParamsCopyWithImpl(this._self, this._then);

  final _WatchMessagesParams _self;
  final $Res Function(_WatchMessagesParams) _then;

/// Create a copy of WatchMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_WatchMessagesParams(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
