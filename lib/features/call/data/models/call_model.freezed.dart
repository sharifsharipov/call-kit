// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallModel {

 String get id; String get peerId; String get peerName;@JsonKey(unknownEnumValue: CallDirection.incoming) CallDirection get direction;@JsonKey(unknownEnumValue: CallMedia.audio) CallMedia get media;@JsonKey(unknownEnumValue: CallStatus.ringing) CallStatus get status;@EpochMillisConverter() DateTime get createdAt; String? get peerAvatarUrl;@NullableEpochMillisConverter() DateTime? get connectedAt; bool get isMicrophoneEnabled; bool get isSpeakerEnabled; bool get isCameraEnabled; bool get isFrontCamera;
/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallModelCopyWith<CallModel> get copyWith => _$CallModelCopyWithImpl<CallModel>(this as CallModel, _$identity);

  /// Serializes this CallModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.media, media) || other.media == media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,direction,media,status,createdAt,peerAvatarUrl,connectedAt,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'CallModel(id: $id, peerId: $peerId, peerName: $peerName, direction: $direction, media: $media, status: $status, createdAt: $createdAt, peerAvatarUrl: $peerAvatarUrl, connectedAt: $connectedAt, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class $CallModelCopyWith<$Res>  {
  factory $CallModelCopyWith(CallModel value, $Res Function(CallModel) _then) = _$CallModelCopyWithImpl;
@useResult
$Res call({
 String id, String peerId, String peerName,@JsonKey(unknownEnumValue: CallDirection.incoming) CallDirection direction,@JsonKey(unknownEnumValue: CallMedia.audio) CallMedia media,@JsonKey(unknownEnumValue: CallStatus.ringing) CallStatus status,@EpochMillisConverter() DateTime createdAt, String? peerAvatarUrl,@NullableEpochMillisConverter() DateTime? connectedAt, bool isMicrophoneEnabled, bool isSpeakerEnabled, bool isCameraEnabled, bool isFrontCamera
});




}
/// @nodoc
class _$CallModelCopyWithImpl<$Res>
    implements $CallModelCopyWith<$Res> {
  _$CallModelCopyWithImpl(this._self, this._then);

  final CallModel _self;
  final $Res Function(CallModel) _then;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? direction = null,Object? media = null,Object? status = null,Object? createdAt = null,Object? peerAvatarUrl = freezed,Object? connectedAt = freezed,Object? isMicrophoneEnabled = null,Object? isSpeakerEnabled = null,Object? isCameraEnabled = null,Object? isFrontCamera = null,}) {
  return _then(CallModel(
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


/// Adds pattern-matching-related methods to [CallModel].
extension CallModelPatterns on CallModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallModel value)  $default,){
final _that = this;
switch (_that) {
case _CallModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallModel value)?  $default,){
final _that = this;
switch (_that) {
case _CallModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName, @JsonKey(unknownEnumValue: CallDirection.incoming)  CallDirection direction, @JsonKey(unknownEnumValue: CallMedia.audio)  CallMedia media, @JsonKey(unknownEnumValue: CallStatus.ringing)  CallStatus status, @EpochMillisConverter()  DateTime createdAt,  String? peerAvatarUrl, @NullableEpochMillisConverter()  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String peerId,  String peerName, @JsonKey(unknownEnumValue: CallDirection.incoming)  CallDirection direction, @JsonKey(unknownEnumValue: CallMedia.audio)  CallMedia media, @JsonKey(unknownEnumValue: CallStatus.ringing)  CallStatus status, @EpochMillisConverter()  DateTime createdAt,  String? peerAvatarUrl, @NullableEpochMillisConverter()  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)  $default,) {final _that = this;
switch (_that) {
case _CallModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String peerId,  String peerName, @JsonKey(unknownEnumValue: CallDirection.incoming)  CallDirection direction, @JsonKey(unknownEnumValue: CallMedia.audio)  CallMedia media, @JsonKey(unknownEnumValue: CallStatus.ringing)  CallStatus status, @EpochMillisConverter()  DateTime createdAt,  String? peerAvatarUrl, @NullableEpochMillisConverter()  DateTime? connectedAt,  bool isMicrophoneEnabled,  bool isSpeakerEnabled,  bool isCameraEnabled,  bool isFrontCamera)?  $default,) {final _that = this;
switch (_that) {
case _CallModel() when $default != null:
return $default(_that.id,_that.peerId,_that.peerName,_that.direction,_that.media,_that.status,_that.createdAt,_that.peerAvatarUrl,_that.connectedAt,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallModel extends CallModel {
  const _CallModel({required this.id, required this.peerId, required this.peerName, @JsonKey(unknownEnumValue: CallDirection.incoming) required this.direction, @JsonKey(unknownEnumValue: CallMedia.audio) required this.media, @JsonKey(unknownEnumValue: CallStatus.ringing) required this.status, @EpochMillisConverter() required this.createdAt, this.peerAvatarUrl, @NullableEpochMillisConverter() this.connectedAt, this.isMicrophoneEnabled = true, this.isSpeakerEnabled = false, this.isCameraEnabled = true, this.isFrontCamera = true}): super._();
  factory _CallModel.fromJson(Map<String, dynamic> json) => _$CallModelFromJson(json);

@override final  String id;
@override final  String peerId;
@override final  String peerName;
@override@JsonKey(unknownEnumValue: CallDirection.incoming) final  CallDirection direction;
@override@JsonKey(unknownEnumValue: CallMedia.audio) final  CallMedia media;
@override@JsonKey(unknownEnumValue: CallStatus.ringing) final  CallStatus status;
@override@EpochMillisConverter() final  DateTime createdAt;
@override final  String? peerAvatarUrl;
@override@NullableEpochMillisConverter() final  DateTime? connectedAt;
@override@JsonKey() final  bool isMicrophoneEnabled;
@override@JsonKey() final  bool isSpeakerEnabled;
@override@JsonKey() final  bool isCameraEnabled;
@override@JsonKey() final  bool isFrontCamera;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallModelCopyWith<_CallModel> get copyWith => __$CallModelCopyWithImpl<_CallModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.media, media) || other.media == media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,peerId,peerName,direction,media,status,createdAt,peerAvatarUrl,connectedAt,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'CallModel(id: $id, peerId: $peerId, peerName: $peerName, direction: $direction, media: $media, status: $status, createdAt: $createdAt, peerAvatarUrl: $peerAvatarUrl, connectedAt: $connectedAt, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class _$CallModelCopyWith<$Res> implements $CallModelCopyWith<$Res> {
  factory _$CallModelCopyWith(_CallModel value, $Res Function(_CallModel) _then) = __$CallModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String peerId, String peerName,@JsonKey(unknownEnumValue: CallDirection.incoming) CallDirection direction,@JsonKey(unknownEnumValue: CallMedia.audio) CallMedia media,@JsonKey(unknownEnumValue: CallStatus.ringing) CallStatus status,@EpochMillisConverter() DateTime createdAt, String? peerAvatarUrl,@NullableEpochMillisConverter() DateTime? connectedAt, bool isMicrophoneEnabled, bool isSpeakerEnabled, bool isCameraEnabled, bool isFrontCamera
});




}
/// @nodoc
class __$CallModelCopyWithImpl<$Res>
    implements _$CallModelCopyWith<$Res> {
  __$CallModelCopyWithImpl(this._self, this._then);

  final _CallModel _self;
  final $Res Function(_CallModel) _then;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? peerId = null,Object? peerName = null,Object? direction = null,Object? media = null,Object? status = null,Object? createdAt = null,Object? peerAvatarUrl = freezed,Object? connectedAt = freezed,Object? isMicrophoneEnabled = null,Object? isSpeakerEnabled = null,Object? isCameraEnabled = null,Object? isFrontCamera = null,}) {
  return _then(_CallModel(
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
