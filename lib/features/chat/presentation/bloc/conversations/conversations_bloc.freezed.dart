// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationsEvent {

 String get userId;
/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationsEventCopyWith<ConversationsEvent> get copyWith => _$ConversationsEventCopyWithImpl<ConversationsEvent>(this as ConversationsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ConversationsEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ConversationsEventCopyWith<$Res>  {
  factory $ConversationsEventCopyWith(ConversationsEvent value, $Res Function(ConversationsEvent) _then) = _$ConversationsEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$ConversationsEventCopyWithImpl<$Res>
    implements $ConversationsEventCopyWith<$Res> {
  _$ConversationsEventCopyWithImpl(this._self, this._then);

  final ConversationsEvent _self;
  final $Res Function(ConversationsEvent) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(ConversationsEvent.subscriptionRequested(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationsEvent].
extension ConversationsEventPatterns on ConversationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConversationsSubscriptionRequested value)?  subscriptionRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConversationsSubscriptionRequested value)  subscriptionRequested,}){
final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested():
return subscriptionRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConversationsSubscriptionRequested value)?  subscriptionRequested,}){
final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  subscriptionRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  subscriptionRequested,}) {final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested():
return subscriptionRequested(_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  subscriptionRequested,}) {final _that = this;
switch (_that) {
case ConversationsSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class ConversationsSubscriptionRequested implements ConversationsEvent {
  const ConversationsSubscriptionRequested({required this.userId});
  

@override final  String userId;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationsSubscriptionRequestedCopyWith<ConversationsSubscriptionRequested> get copyWith => _$ConversationsSubscriptionRequestedCopyWithImpl<ConversationsSubscriptionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsSubscriptionRequested&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ConversationsEvent.subscriptionRequested(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ConversationsSubscriptionRequestedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory $ConversationsSubscriptionRequestedCopyWith(ConversationsSubscriptionRequested value, $Res Function(ConversationsSubscriptionRequested) _then) = _$ConversationsSubscriptionRequestedCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$ConversationsSubscriptionRequestedCopyWithImpl<$Res>
    implements $ConversationsSubscriptionRequestedCopyWith<$Res> {
  _$ConversationsSubscriptionRequestedCopyWithImpl(this._self, this._then);

  final ConversationsSubscriptionRequested _self;
  final $Res Function(ConversationsSubscriptionRequested) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(ConversationsSubscriptionRequested(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ConversationsState {

 ConversationsStatus get status; List<Conversation> get conversations; Failure? get failure;
/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationsStateCopyWith<ConversationsState> get copyWith => _$ConversationsStateCopyWithImpl<ConversationsState>(this as ConversationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.conversations, conversations)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(conversations),failure);

@override
String toString() {
  return 'ConversationsState(status: $status, conversations: $conversations, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ConversationsStateCopyWith<$Res>  {
  factory $ConversationsStateCopyWith(ConversationsState value, $Res Function(ConversationsState) _then) = _$ConversationsStateCopyWithImpl;
@useResult
$Res call({
 ConversationsStatus status, List<Conversation> conversations, Failure? failure
});




}
/// @nodoc
class _$ConversationsStateCopyWithImpl<$Res>
    implements $ConversationsStateCopyWith<$Res> {
  _$ConversationsStateCopyWithImpl(this._self, this._then);

  final ConversationsState _self;
  final $Res Function(ConversationsState) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? conversations = null,Object? failure = freezed,}) {
  return _then(ConversationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConversationsStatus,conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationsState].
extension ConversationsStatePatterns on ConversationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationsState value)  $default,){
final _that = this;
switch (_that) {
case _ConversationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationsState value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConversationsStatus status,  List<Conversation> conversations,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationsState() when $default != null:
return $default(_that.status,_that.conversations,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConversationsStatus status,  List<Conversation> conversations,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ConversationsState():
return $default(_that.status,_that.conversations,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConversationsStatus status,  List<Conversation> conversations,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ConversationsState() when $default != null:
return $default(_that.status,_that.conversations,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationsState extends ConversationsState {
  const _ConversationsState({this.status = ConversationsStatus.initial,  List<Conversation> conversations = const <Conversation>[], this.failure}): _conversations = conversations,super._();
  

@override@JsonKey() final  ConversationsStatus status;
 final  List<Conversation> _conversations;
@override@JsonKey() List<Conversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@override final  Failure? failure;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationsStateCopyWith<_ConversationsState> get copyWith => __$ConversationsStateCopyWithImpl<_ConversationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_conversations),failure);

@override
String toString() {
  return 'ConversationsState(status: $status, conversations: $conversations, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ConversationsStateCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$ConversationsStateCopyWith(_ConversationsState value, $Res Function(_ConversationsState) _then) = __$ConversationsStateCopyWithImpl;
@override @useResult
$Res call({
 ConversationsStatus status, List<Conversation> conversations, Failure? failure
});




}
/// @nodoc
class __$ConversationsStateCopyWithImpl<$Res>
    implements _$ConversationsStateCopyWith<$Res> {
  __$ConversationsStateCopyWithImpl(this._self, this._then);

  final _ConversationsState _self;
  final $Res Function(_ConversationsState) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? conversations = null,Object? failure = freezed,}) {
  return _then(_ConversationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConversationsStatus,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
