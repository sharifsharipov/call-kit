// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Conversation {

 String get id; String get peerId; String get peerName; DateTime get lastMessageAt; String? get peerAvatarUrl; String get lastMessagePreview; int get unreadCount; bool get isPeerOnline;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isPeerOnline, isPeerOnline) || other.isPeerOnline == isPeerOnline));
}


@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,lastMessageAt,peerAvatarUrl,lastMessagePreview,unreadCount,isPeerOnline);

@override
String toString() {
  return 'Conversation(id: $id, peerId: $peerId, peerName: $peerName, lastMessageAt: $lastMessageAt, peerAvatarUrl: $peerAvatarUrl, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, isPeerOnline: $isPeerOnline)';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String id, String peerId, String peerName, DateTime lastMessageAt, String? peerAvatarUrl, String lastMessagePreview, int unreadCount, bool isPeerOnline
});




}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? lastMessageAt = null,Object? peerAvatarUrl = freezed,Object? lastMessagePreview = null,Object? unreadCount = null,Object? isPeerOnline = null,}) {
  return _then(Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: null == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isPeerOnline: null == isPeerOnline ? _self.isPeerOnline : isPeerOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName,  DateTime lastMessageAt,  String? peerAvatarUrl,  String lastMessagePreview,  int unreadCount,  bool isPeerOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.peerId,_that.peerName,_that.lastMessageAt,_that.peerAvatarUrl,_that.lastMessagePreview,_that.unreadCount,_that.isPeerOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName,  DateTime lastMessageAt,  String? peerAvatarUrl,  String lastMessagePreview,  int unreadCount,  bool isPeerOnline)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.id,_that.peerId,_that.peerName,_that.lastMessageAt,_that.peerAvatarUrl,_that.lastMessagePreview,_that.unreadCount,_that.isPeerOnline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String peerId,  String peerName,  DateTime lastMessageAt,  String? peerAvatarUrl,  String lastMessagePreview,  int unreadCount,  bool isPeerOnline)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.peerId,_that.peerName,_that.lastMessageAt,_that.peerAvatarUrl,_that.lastMessagePreview,_that.unreadCount,_that.isPeerOnline);case _:
  return null;

}
}

}

/// @nodoc


class _Conversation extends Conversation {
  const _Conversation({required this.id, required this.peerId, required this.peerName, required this.lastMessageAt, this.peerAvatarUrl, this.lastMessagePreview = '', this.unreadCount = 0, this.isPeerOnline = false}): super._();
  

@override final  String id;
@override final  String peerId;
@override final  String peerName;
@override final  DateTime lastMessageAt;
@override final  String? peerAvatarUrl;
@override@JsonKey() final  String lastMessagePreview;
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isPeerOnline;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isPeerOnline, isPeerOnline) || other.isPeerOnline == isPeerOnline));
}


@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,lastMessageAt,peerAvatarUrl,lastMessagePreview,unreadCount,isPeerOnline);

@override
String toString() {
  return 'Conversation(id: $id, peerId: $peerId, peerName: $peerName, lastMessageAt: $lastMessageAt, peerAvatarUrl: $peerAvatarUrl, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, isPeerOnline: $isPeerOnline)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, String peerId, String peerName, DateTime lastMessageAt, String? peerAvatarUrl, String lastMessagePreview, int unreadCount, bool isPeerOnline
});




}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? lastMessageAt = null,Object? peerAvatarUrl = freezed,Object? lastMessagePreview = null,Object? unreadCount = null,Object? isPeerOnline = null,}) {
  return _then(_Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: null == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isPeerOnline: null == isPeerOnline ? _self.isPeerOnline : isPeerOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
