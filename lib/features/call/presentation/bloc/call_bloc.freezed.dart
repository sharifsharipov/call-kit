// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CallEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent()';
}


}

/// @nodoc
class $CallEventCopyWith<$Res>  {
$CallEventCopyWith(CallEvent _, $Res Function(CallEvent) __);
}


/// Adds pattern-matching-related methods to [CallEvent].
extension CallEventPatterns on CallEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CallSubscriptionRequested value)?  subscriptionRequested,TResult Function( CallAnswered value)?  answered,TResult Function( CallRejected value)?  rejected,TResult Function( CallHungUp value)?  hungUp,TResult Function( CallMediaToggled value)?  mediaToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CallSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case CallAnswered() when answered != null:
return answered(_that);case CallRejected() when rejected != null:
return rejected(_that);case CallHungUp() when hungUp != null:
return hungUp(_that);case CallMediaToggled() when mediaToggled != null:
return mediaToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CallSubscriptionRequested value)  subscriptionRequested,required TResult Function( CallAnswered value)  answered,required TResult Function( CallRejected value)  rejected,required TResult Function( CallHungUp value)  hungUp,required TResult Function( CallMediaToggled value)  mediaToggled,}){
final _that = this;
switch (_that) {
case CallSubscriptionRequested():
return subscriptionRequested(_that);case CallAnswered():
return answered(_that);case CallRejected():
return rejected(_that);case CallHungUp():
return hungUp(_that);case CallMediaToggled():
return mediaToggled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CallSubscriptionRequested value)?  subscriptionRequested,TResult? Function( CallAnswered value)?  answered,TResult? Function( CallRejected value)?  rejected,TResult? Function( CallHungUp value)?  hungUp,TResult? Function( CallMediaToggled value)?  mediaToggled,}){
final _that = this;
switch (_that) {
case CallSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case CallAnswered() when answered != null:
return answered(_that);case CallRejected() when rejected != null:
return rejected(_that);case CallHungUp() when hungUp != null:
return hungUp(_that);case CallMediaToggled() when mediaToggled != null:
return mediaToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String callId)?  subscriptionRequested,TResult Function()?  answered,TResult Function()?  rejected,TResult Function()?  hungUp,TResult Function( CallMediaControl control)?  mediaToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CallSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.callId);case CallAnswered() when answered != null:
return answered();case CallRejected() when rejected != null:
return rejected();case CallHungUp() when hungUp != null:
return hungUp();case CallMediaToggled() when mediaToggled != null:
return mediaToggled(_that.control);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String callId)  subscriptionRequested,required TResult Function()  answered,required TResult Function()  rejected,required TResult Function()  hungUp,required TResult Function( CallMediaControl control)  mediaToggled,}) {final _that = this;
switch (_that) {
case CallSubscriptionRequested():
return subscriptionRequested(_that.callId);case CallAnswered():
return answered();case CallRejected():
return rejected();case CallHungUp():
return hungUp();case CallMediaToggled():
return mediaToggled(_that.control);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String callId)?  subscriptionRequested,TResult? Function()?  answered,TResult? Function()?  rejected,TResult? Function()?  hungUp,TResult? Function( CallMediaControl control)?  mediaToggled,}) {final _that = this;
switch (_that) {
case CallSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.callId);case CallAnswered() when answered != null:
return answered();case CallRejected() when rejected != null:
return rejected();case CallHungUp() when hungUp != null:
return hungUp();case CallMediaToggled() when mediaToggled != null:
return mediaToggled(_that.control);case _:
  return null;

}
}

}

/// @nodoc


class CallSubscriptionRequested implements CallEvent {
  const CallSubscriptionRequested({required this.callId});
  

 final  String callId;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallSubscriptionRequestedCopyWith<CallSubscriptionRequested> get copyWith => _$CallSubscriptionRequestedCopyWithImpl<CallSubscriptionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallSubscriptionRequested&&(identical(other.callId, callId) || other.callId == callId));
}


@override
int get hashCode => Object.hash(runtimeType,callId);

@override
String toString() {
  return 'CallEvent.subscriptionRequested(callId: $callId)';
}


}

/// @nodoc
abstract mixin class $CallSubscriptionRequestedCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory $CallSubscriptionRequestedCopyWith(CallSubscriptionRequested value, $Res Function(CallSubscriptionRequested) _then) = _$CallSubscriptionRequestedCopyWithImpl;
@useResult
$Res call({
 String callId
});




}
/// @nodoc
class _$CallSubscriptionRequestedCopyWithImpl<$Res>
    implements $CallSubscriptionRequestedCopyWith<$Res> {
  _$CallSubscriptionRequestedCopyWithImpl(this._self, this._then);

  final CallSubscriptionRequested _self;
  final $Res Function(CallSubscriptionRequested) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? callId = null,}) {
  return _then(CallSubscriptionRequested(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CallAnswered implements CallEvent {
  const CallAnswered();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallAnswered);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.answered()';
}


}




/// @nodoc


class CallRejected implements CallEvent {
  const CallRejected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallRejected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.rejected()';
}


}




/// @nodoc


class CallHungUp implements CallEvent {
  const CallHungUp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallHungUp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.hungUp()';
}


}




/// @nodoc


class CallMediaToggled implements CallEvent {
  const CallMediaToggled(this.control);
  

 final  CallMediaControl control;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallMediaToggledCopyWith<CallMediaToggled> get copyWith => _$CallMediaToggledCopyWithImpl<CallMediaToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallMediaToggled&&(identical(other.control, control) || other.control == control));
}


@override
int get hashCode => Object.hash(runtimeType,control);

@override
String toString() {
  return 'CallEvent.mediaToggled(control: $control)';
}


}

/// @nodoc
abstract mixin class $CallMediaToggledCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory $CallMediaToggledCopyWith(CallMediaToggled value, $Res Function(CallMediaToggled) _then) = _$CallMediaToggledCopyWithImpl;
@useResult
$Res call({
 CallMediaControl control
});




}
/// @nodoc
class _$CallMediaToggledCopyWithImpl<$Res>
    implements $CallMediaToggledCopyWith<$Res> {
  _$CallMediaToggledCopyWithImpl(this._self, this._then);

  final CallMediaToggled _self;
  final $Res Function(CallMediaToggled) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? control = null,}) {
  return _then(CallMediaToggled(
null == control ? _self.control : control // ignore: cast_nullable_to_non_nullable
as CallMediaControl,
  ));
}


}

/// @nodoc
mixin _$CallState {

 String get callId; CallStateStatus get status;/// Named `activeCall` rather than `call`: freezed's generated `copyWith`
/// object is itself callable, so a field named `call` collides with it.
 Call? get activeCall; Failure? get failure;
/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallStateCopyWith<CallState> get copyWith => _$CallStateCopyWithImpl<CallState>(this as CallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallState&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.status, status) || other.status == status)&&(identical(other.activeCall, activeCall) || other.activeCall == activeCall)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,callId,status,activeCall,failure);

@override
String toString() {
  return 'CallState(callId: $callId, status: $status, activeCall: $activeCall, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CallStateCopyWith<$Res>  {
  factory $CallStateCopyWith(CallState value, $Res Function(CallState) _then) = _$CallStateCopyWithImpl;
@useResult
$Res call({
 String callId, CallStateStatus status, Call? activeCall, Failure? failure
});


$CallCopyWith<$Res>? get activeCall;

}
/// @nodoc
class _$CallStateCopyWithImpl<$Res>
    implements $CallStateCopyWith<$Res> {
  _$CallStateCopyWithImpl(this._self, this._then);

  final CallState _self;
  final $Res Function(CallState) _then;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? callId = null,Object? status = null,Object? activeCall = freezed,Object? failure = freezed,}) {
  return _then(CallState(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStateStatus,activeCall: freezed == activeCall ? _self.activeCall : activeCall // ignore: cast_nullable_to_non_nullable
as Call?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallCopyWith<$Res>? get activeCall {
    if (_self.activeCall == null) {
    return null;
  }

  return $CallCopyWith<$Res>(_self.activeCall!, (value) {
    return _then(_self.copyWith(activeCall: value));
  });
}
}


/// Adds pattern-matching-related methods to [CallState].
extension CallStatePatterns on CallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallState value)  $default,){
final _that = this;
switch (_that) {
case _CallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallState value)?  $default,){
final _that = this;
switch (_that) {
case _CallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String callId,  CallStateStatus status,  Call? activeCall,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallState() when $default != null:
return $default(_that.callId,_that.status,_that.activeCall,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String callId,  CallStateStatus status,  Call? activeCall,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _CallState():
return $default(_that.callId,_that.status,_that.activeCall,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String callId,  CallStateStatus status,  Call? activeCall,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _CallState() when $default != null:
return $default(_that.callId,_that.status,_that.activeCall,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CallState extends CallState {
  const _CallState({required this.callId, this.status = CallStateStatus.initial, this.activeCall, this.failure}): super._();
  

@override final  String callId;
@override@JsonKey() final  CallStateStatus status;
/// Named `activeCall` rather than `call`: freezed's generated `copyWith`
/// object is itself callable, so a field named `call` collides with it.
@override final  Call? activeCall;
@override final  Failure? failure;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallStateCopyWith<_CallState> get copyWith => __$CallStateCopyWithImpl<_CallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallState&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.status, status) || other.status == status)&&(identical(other.activeCall, activeCall) || other.activeCall == activeCall)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,callId,status,activeCall,failure);

@override
String toString() {
  return 'CallState(callId: $callId, status: $status, activeCall: $activeCall, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CallStateCopyWith<$Res> implements $CallStateCopyWith<$Res> {
  factory _$CallStateCopyWith(_CallState value, $Res Function(_CallState) _then) = __$CallStateCopyWithImpl;
@override @useResult
$Res call({
 String callId, CallStateStatus status, Call? activeCall, Failure? failure
});


@override $CallCopyWith<$Res>? get activeCall;

}
/// @nodoc
class __$CallStateCopyWithImpl<$Res>
    implements _$CallStateCopyWith<$Res> {
  __$CallStateCopyWithImpl(this._self, this._then);

  final _CallState _self;
  final $Res Function(_CallState) _then;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? callId = null,Object? status = null,Object? activeCall = freezed,Object? failure = freezed,}) {
  return _then(_CallState(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStateStatus,activeCall: freezed == activeCall ? _self.activeCall : activeCall // ignore: cast_nullable_to_non_nullable
as Call?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallCopyWith<$Res>? get activeCall {
    if (_self.activeCall == null) {
    return null;
  }

  return $CallCopyWith<$Res>(_self.activeCall!, (value) {
    return _then(_self.copyWith(activeCall: value));
  });
}
}

// dart format on
