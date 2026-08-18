// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CallIdParams {

 String get callId;
/// Create a copy of CallIdParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallIdParamsCopyWith<CallIdParams> get copyWith => _$CallIdParamsCopyWithImpl<CallIdParams>(this as CallIdParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallIdParams&&(identical(other.callId, callId) || other.callId == callId));
}


@override
int get hashCode => Object.hash(runtimeType,callId);

@override
String toString() {
  return 'CallIdParams(callId: $callId)';
}


}

/// @nodoc
abstract mixin class $CallIdParamsCopyWith<$Res>  {
  factory $CallIdParamsCopyWith(CallIdParams value, $Res Function(CallIdParams) _then) = _$CallIdParamsCopyWithImpl;
@useResult
$Res call({
 String callId
});




}
/// @nodoc
class _$CallIdParamsCopyWithImpl<$Res>
    implements $CallIdParamsCopyWith<$Res> {
  _$CallIdParamsCopyWithImpl(this._self, this._then);

  final CallIdParams _self;
  final $Res Function(CallIdParams) _then;

/// Create a copy of CallIdParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? callId = null,}) {
  return _then(CallIdParams(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CallIdParams].
extension CallIdParamsPatterns on CallIdParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallIdParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallIdParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallIdParams value)  $default,){
final _that = this;
switch (_that) {
case _CallIdParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallIdParams value)?  $default,){
final _that = this;
switch (_that) {
case _CallIdParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String callId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallIdParams() when $default != null:
return $default(_that.callId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String callId)  $default,) {final _that = this;
switch (_that) {
case _CallIdParams():
return $default(_that.callId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String callId)?  $default,) {final _that = this;
switch (_that) {
case _CallIdParams() when $default != null:
return $default(_that.callId);case _:
  return null;

}
}

}

/// @nodoc


class _CallIdParams implements CallIdParams {
  const _CallIdParams({required this.callId});
  

@override final  String callId;

/// Create a copy of CallIdParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallIdParamsCopyWith<_CallIdParams> get copyWith => __$CallIdParamsCopyWithImpl<_CallIdParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallIdParams&&(identical(other.callId, callId) || other.callId == callId));
}


@override
int get hashCode => Object.hash(runtimeType,callId);

@override
String toString() {
  return 'CallIdParams(callId: $callId)';
}


}

/// @nodoc
abstract mixin class _$CallIdParamsCopyWith<$Res> implements $CallIdParamsCopyWith<$Res> {
  factory _$CallIdParamsCopyWith(_CallIdParams value, $Res Function(_CallIdParams) _then) = __$CallIdParamsCopyWithImpl;
@override @useResult
$Res call({
 String callId
});




}
/// @nodoc
class __$CallIdParamsCopyWithImpl<$Res>
    implements _$CallIdParamsCopyWith<$Res> {
  __$CallIdParamsCopyWithImpl(this._self, this._then);

  final _CallIdParams _self;
  final $Res Function(_CallIdParams) _then;

/// Create a copy of CallIdParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? callId = null,}) {
  return _then(_CallIdParams(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StartCallParams {

 String get peerId; CallMedia get media;
/// Create a copy of StartCallParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartCallParamsCopyWith<StartCallParams> get copyWith => _$StartCallParamsCopyWithImpl<StartCallParams>(this as StartCallParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartCallParams&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.media, media) || other.media == media));
}


@override
int get hashCode => Object.hash(runtimeType,peerId,media);

@override
String toString() {
  return 'StartCallParams(peerId: $peerId, media: $media)';
}


}

/// @nodoc
abstract mixin class $StartCallParamsCopyWith<$Res>  {
  factory $StartCallParamsCopyWith(StartCallParams value, $Res Function(StartCallParams) _then) = _$StartCallParamsCopyWithImpl;
@useResult
$Res call({
 String peerId, CallMedia media
});




}
/// @nodoc
class _$StartCallParamsCopyWithImpl<$Res>
    implements $StartCallParamsCopyWith<$Res> {
  _$StartCallParamsCopyWithImpl(this._self, this._then);

  final StartCallParams _self;
  final $Res Function(StartCallParams) _then;

/// Create a copy of StartCallParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? peerId = null,Object? media = null,}) {
  return _then(StartCallParams(
peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as CallMedia,
  ));
}

}


/// Adds pattern-matching-related methods to [StartCallParams].
extension StartCallParamsPatterns on StartCallParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartCallParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartCallParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartCallParams value)  $default,){
final _that = this;
switch (_that) {
case _StartCallParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartCallParams value)?  $default,){
final _that = this;
switch (_that) {
case _StartCallParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String peerId,  CallMedia media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartCallParams() when $default != null:
return $default(_that.peerId,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String peerId,  CallMedia media)  $default,) {final _that = this;
switch (_that) {
case _StartCallParams():
return $default(_that.peerId,_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String peerId,  CallMedia media)?  $default,) {final _that = this;
switch (_that) {
case _StartCallParams() when $default != null:
return $default(_that.peerId,_that.media);case _:
  return null;

}
}

}

/// @nodoc


class _StartCallParams implements StartCallParams {
  const _StartCallParams({required this.peerId, required this.media});
  

@override final  String peerId;
@override final  CallMedia media;

/// Create a copy of StartCallParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartCallParamsCopyWith<_StartCallParams> get copyWith => __$StartCallParamsCopyWithImpl<_StartCallParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartCallParams&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.media, media) || other.media == media));
}


@override
int get hashCode => Object.hash(runtimeType,peerId,media);

@override
String toString() {
  return 'StartCallParams(peerId: $peerId, media: $media)';
}


}

/// @nodoc
abstract mixin class _$StartCallParamsCopyWith<$Res> implements $StartCallParamsCopyWith<$Res> {
  factory _$StartCallParamsCopyWith(_StartCallParams value, $Res Function(_StartCallParams) _then) = __$StartCallParamsCopyWithImpl;
@override @useResult
$Res call({
 String peerId, CallMedia media
});




}
/// @nodoc
class __$StartCallParamsCopyWithImpl<$Res>
    implements _$StartCallParamsCopyWith<$Res> {
  __$StartCallParamsCopyWithImpl(this._self, this._then);

  final _StartCallParams _self;
  final $Res Function(_StartCallParams) _then;

/// Create a copy of StartCallParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? peerId = null,Object? media = null,}) {
  return _then(_StartCallParams(
peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as CallMedia,
  ));
}


}

/// @nodoc
mixin _$UpdateCallMediaParams {

 String get callId; bool? get isMicrophoneEnabled; bool? get isSpeakerEnabled; bool? get isCameraEnabled; bool? get isFrontCamera;
/// Create a copy of UpdateCallMediaParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCallMediaParamsCopyWith<UpdateCallMediaParams> get copyWith => _$UpdateCallMediaParamsCopyWithImpl<UpdateCallMediaParams>(this as UpdateCallMediaParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCallMediaParams&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}


@override
int get hashCode => Object.hash(runtimeType,callId,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'UpdateCallMediaParams(callId: $callId, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class $UpdateCallMediaParamsCopyWith<$Res>  {
  factory $UpdateCallMediaParamsCopyWith(UpdateCallMediaParams value, $Res Function(UpdateCallMediaParams) _then) = _$UpdateCallMediaParamsCopyWithImpl;
@useResult
$Res call({
 String callId, bool? isMicrophoneEnabled, bool? isSpeakerEnabled, bool? isCameraEnabled, bool? isFrontCamera
});




}
/// @nodoc
class _$UpdateCallMediaParamsCopyWithImpl<$Res>
    implements $UpdateCallMediaParamsCopyWith<$Res> {
  _$UpdateCallMediaParamsCopyWithImpl(this._self, this._then);

  final UpdateCallMediaParams _self;
  final $Res Function(UpdateCallMediaParams) _then;

/// Create a copy of UpdateCallMediaParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? callId = null,Object? isMicrophoneEnabled = freezed,Object? isSpeakerEnabled = freezed,Object? isCameraEnabled = freezed,Object? isFrontCamera = freezed,}) {
  return _then(UpdateCallMediaParams(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,isMicrophoneEnabled: freezed == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isSpeakerEnabled: freezed == isSpeakerEnabled ? _self.isSpeakerEnabled : isSpeakerEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isCameraEnabled: freezed == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isFrontCamera: freezed == isFrontCamera ? _self.isFrontCamera : isFrontCamera // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCallMediaParams].
extension UpdateCallMediaParamsPatterns on UpdateCallMediaParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCallMediaParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCallMediaParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCallMediaParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCallMediaParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCallMediaParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCallMediaParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String callId,  bool? isMicrophoneEnabled,  bool? isSpeakerEnabled,  bool? isCameraEnabled,  bool? isFrontCamera)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCallMediaParams() when $default != null:
return $default(_that.callId,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String callId,  bool? isMicrophoneEnabled,  bool? isSpeakerEnabled,  bool? isCameraEnabled,  bool? isFrontCamera)  $default,) {final _that = this;
switch (_that) {
case _UpdateCallMediaParams():
return $default(_that.callId,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String callId,  bool? isMicrophoneEnabled,  bool? isSpeakerEnabled,  bool? isCameraEnabled,  bool? isFrontCamera)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCallMediaParams() when $default != null:
return $default(_that.callId,_that.isMicrophoneEnabled,_that.isSpeakerEnabled,_that.isCameraEnabled,_that.isFrontCamera);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateCallMediaParams implements UpdateCallMediaParams {
  const _UpdateCallMediaParams({required this.callId, this.isMicrophoneEnabled, this.isSpeakerEnabled, this.isCameraEnabled, this.isFrontCamera});
  

@override final  String callId;
@override final  bool? isMicrophoneEnabled;
@override final  bool? isSpeakerEnabled;
@override final  bool? isCameraEnabled;
@override final  bool? isFrontCamera;

/// Create a copy of UpdateCallMediaParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCallMediaParamsCopyWith<_UpdateCallMediaParams> get copyWith => __$UpdateCallMediaParamsCopyWithImpl<_UpdateCallMediaParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCallMediaParams&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.isSpeakerEnabled, isSpeakerEnabled) || other.isSpeakerEnabled == isSpeakerEnabled)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isFrontCamera, isFrontCamera) || other.isFrontCamera == isFrontCamera));
}


@override
int get hashCode => Object.hash(runtimeType,callId,isMicrophoneEnabled,isSpeakerEnabled,isCameraEnabled,isFrontCamera);

@override
String toString() {
  return 'UpdateCallMediaParams(callId: $callId, isMicrophoneEnabled: $isMicrophoneEnabled, isSpeakerEnabled: $isSpeakerEnabled, isCameraEnabled: $isCameraEnabled, isFrontCamera: $isFrontCamera)';
}


}

/// @nodoc
abstract mixin class _$UpdateCallMediaParamsCopyWith<$Res> implements $UpdateCallMediaParamsCopyWith<$Res> {
  factory _$UpdateCallMediaParamsCopyWith(_UpdateCallMediaParams value, $Res Function(_UpdateCallMediaParams) _then) = __$UpdateCallMediaParamsCopyWithImpl;
@override @useResult
$Res call({
 String callId, bool? isMicrophoneEnabled, bool? isSpeakerEnabled, bool? isCameraEnabled, bool? isFrontCamera
});




}
/// @nodoc
class __$UpdateCallMediaParamsCopyWithImpl<$Res>
    implements _$UpdateCallMediaParamsCopyWith<$Res> {
  __$UpdateCallMediaParamsCopyWithImpl(this._self, this._then);

  final _UpdateCallMediaParams _self;
  final $Res Function(_UpdateCallMediaParams) _then;

/// Create a copy of UpdateCallMediaParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? callId = null,Object? isMicrophoneEnabled = freezed,Object? isSpeakerEnabled = freezed,Object? isCameraEnabled = freezed,Object? isFrontCamera = freezed,}) {
  return _then(_UpdateCallMediaParams(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,isMicrophoneEnabled: freezed == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isSpeakerEnabled: freezed == isSpeakerEnabled ? _self.isSpeakerEnabled : isSpeakerEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isCameraEnabled: freezed == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool?,isFrontCamera: freezed == isFrontCamera ? _self.isFrontCamera : isFrontCamera // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
