// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Call {

 String get id; String get peerId; String get peerName; CallDirection get direction; CallMedia get media; CallStatus get status; DateTime get createdAt; String? get peerAvatarUrl; DateTime? get connectedAt; bool get isMicrophoneEnabled; bool get isSpeakerEnabled; bool get isCameraEnabled; bool get isFrontCamera;
/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallCopyWith<Call> get copyWith => _$CallCopyWithImpl<Call>(this as Call, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Call&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.media, media) || other.media == media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}


@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,direction,media,status,createdAt,peerAvatarUrl,connectedAt,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'Call(id: $id, peerId: $peerId, peerName: $peerName, direction: $direction, media: $media, status: $status, createdAt: $createdAt, peerAvatarUrl: $peerAvatarUrl, connectedAt: $connectedAt, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class $CallCopyWith<$Res>  {
  factory $CallCopyWith(Call value, $Res Function(Call) _then) = _$CallCopyWithImpl;
@useResult
$Res call({
 String id, String peerId, String peerName, CallDirection direction, CallMedia media, CallStatus status, DateTime createdAt, String? peerAvatarUrl, DateTime? connectedAt, bool isMicrophoneEnabled, bool isSpeakerEnabled, bool isCameraEnabled, bool isFrontCamera
});




}
/// @nodoc
class _$CallCopyWithImpl<$Res>
    implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._self, this._then);

  final Call _self;
  final $Res Function(Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? direction = null,Object? media = null,Object? status = null,Object? createdAt = null,Object? peerAvatarUrl = freezed,Object? connectedAt = freezed,Object? isMicrophoneEnabled = null,Object? isSpeakerEnabled = null,Object? isCameraEnabled = null,Object? isFrontCamera = null,}) {
  return _then(Call(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as CallDirection,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as CallMedia,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMicrophoneEnabled: null == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool,isSpeakerEnabled: null == isSpeakerEnabled ? _self.isSpeakerEnabled : isSpeakerEnabled // ignore: cast_nullable_to_non_nullable
as bool,isCameraEnabled: null == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,isFrontCamera: null == isFrontCamera ? _self.isFrontCamera : isFrontCamera // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Call].
extension CallPatterns on Call {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Call value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Call value)  $default,){
final _that = this;
switch (_that) {
case _Call():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Call value)?  $default,){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName,  CallDirection direction,  CallMedia media,  CallStatus status,  DateTime createdAt,  String? peerAvatarUrl,  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.peerId,_that.peerName,_that.direction,_that.media,_that.status,_that.createdAt,_that.peerAvatarUrl,_that.connectedAt,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName,  CallDirection direction,  CallMedia media,  CallStatus status,  DateTime createdAt,  String? peerAvatarUrl,  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)  $default,) {final _that = this;
switch (_that) {
case _Call():
return $default(_that.id,_that.peerId,_that.peerName,_that.direction,_that.media,_that.status,_that.createdAt,_that.peerAvatarUrl,_that.connectedAt,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String peerId,  String peerName,  CallDirection direction,  CallMedia media,  CallStatus status,  DateTime createdAt,  String? peerAvatarUrl,  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)?  $default,) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.peerId,_that.peerName,_that.direction,_that.media,_that.status,_that.createdAt,_that.peerAvatarUrl,_that.connectedAt,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
  return null;

}
}

}

/// @nodoc


class _Call extends Call {
  const _Call({required this.id, required this.peerId, required this.peerName, required this.direction, required this.media, required this.status, required this.createdAt, this.peerAvatarUrl, this.connectedAt, this.isMicrophoneEnabled = true, this.isSpeakerEnabled = false, this.isCameraEnabled = true, this.isFrontCamera = true}): super._();
  

@override final  String id;
@override final  String peerId;
@override final  String peerName;
@override final  CallDirection direction;
@override final  CallMedia media;
@override final  CallStatus status;
@override final  DateTime createdAt;
@override final  String? peerAvatarUrl;
@override final  DateTime? connectedAt;
@override@JsonKey() final  bool isMicrophoneEnabled;
@override@JsonKey() final  bool isSpeakerEnabled;
@override@JsonKey() final  bool isCameraEnabled;
@override@JsonKey() final  bool isFrontCamera;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallCopyWith<_Call> get copyWith => __$CallCopyWithImpl<_Call>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Call&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.media, media) || other.media == media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}


@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,direction,media,status,createdAt,peerAvatarUrl,connectedAt,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'Call(id: $id, peerId: $peerId, peerName: $peerName, direction: $direction, media: $media, status: $status, createdAt: $createdAt, peerAvatarUrl: $peerAvatarUrl, connectedAt: $connectedAt, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class _$CallCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$CallCopyWith(_Call value, $Res Function(_Call) _then) = __$CallCopyWithImpl;
@override @useResult
$Res call({
 String id, String peerId, String peerName, CallDirection direction, CallMedia media, CallStatus status, DateTime createdAt, String? peerAvatarUrl, DateTime? connectedAt, bool isMicrophoneEnabled, bool isSpeakerEnabled, bool isCameraEnabled, bool isFrontCamera
});




}
/// @nodoc
class __$CallCopyWithImpl<$Res>
    implements _$CallCopyWith<$Res> {
  __$CallCopyWithImpl(this._self, this._then);

  final _Call _self;
  final $Res Function(_Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? direction = null,Object? media = null,Object? status = null,Object? createdAt = null,Object? peerAvatarUrl = freezed,Object? connectedAt = freezed,Object? isMicrophoneEnabled = null,Object? isSpeakerEnabled = null,Object? isCameraEnabled = null,Object? isFrontCamera = null,}) {
  return _then(_Call(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as CallDirection,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as CallMedia,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMicrophoneEnabled: null == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool,isSpeakerEnabled: null == isSpeakerEnabled ? _self.isSpeakerEnabled : isSpeakerEnabled // ignore: cast_nullable_to_non_nullable
as bool,isCameraEnabled: null == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,isFrontCamera: null == isFrontCamera ? _self.isFrontCamera : isFrontCamera // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
