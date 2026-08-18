// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatSubscriptionRequested value)?  subscriptionRequested,TResult Function( ChatMessageSubmitted value)?  messageSubmitted,TResult Function( ChatSendFailureDismissed value)?  sendFailureDismissed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case ChatMessageSubmitted() when messageSubmitted != null:
return messageSubmitted(_that);case ChatSendFailureDismissed() when sendFailureDismissed != null:
return sendFailureDismissed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatSubscriptionRequested value)  subscriptionRequested,required TResult Function( ChatMessageSubmitted value)  messageSubmitted,required TResult Function( ChatSendFailureDismissed value)  sendFailureDismissed,}){
final _that = this;
switch (_that) {
case ChatSubscriptionRequested():
return subscriptionRequested(_that);case ChatMessageSubmitted():
return messageSubmitted(_that);case ChatSendFailureDismissed():
return sendFailureDismissed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatSubscriptionRequested value)?  subscriptionRequested,TResult? Function( ChatMessageSubmitted value)?  messageSubmitted,TResult? Function( ChatSendFailureDismissed value)?  sendFailureDismissed,}){
final _that = this;
switch (_that) {
case ChatSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case ChatMessageSubmitted() when messageSubmitted != null:
return messageSubmitted(_that);case ChatSendFailureDismissed() when sendFailureDismissed != null:
return sendFailureDismissed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String conversationId)?  subscriptionRequested,TResult Function( String text)?  messageSubmitted,TResult Function()?  sendFailureDismissed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.conversationId);case ChatMessageSubmitted() when messageSubmitted != null:
return messageSubmitted(_that.text);case ChatSendFailureDismissed() when sendFailureDismissed != null:
return sendFailureDismissed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String conversationId)  subscriptionRequested,required TResult Function( String text)  messageSubmitted,required TResult Function()  sendFailureDismissed,}) {final _that = this;
switch (_that) {
case ChatSubscriptionRequested():
return subscriptionRequested(_that.conversationId);case ChatMessageSubmitted():
return messageSubmitted(_that.text);case ChatSendFailureDismissed():
return sendFailureDismissed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String conversationId)?  subscriptionRequested,TResult? Function( String text)?  messageSubmitted,TResult? Function()?  sendFailureDismissed,}) {final _that = this;
switch (_that) {
case ChatSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that.conversationId);case ChatMessageSubmitted() when messageSubmitted != null:
return messageSubmitted(_that.text);case ChatSendFailureDismissed() when sendFailureDismissed != null:
return sendFailureDismissed();case _:
  return null;

}
}

}

/// @nodoc


class ChatSubscriptionRequested implements ChatEvent {
  const ChatSubscriptionRequested({required this.conversationId});
  

 final  String conversationId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSubscriptionRequestedCopyWith<ChatSubscriptionRequested> get copyWith => _$ChatSubscriptionRequestedCopyWithImpl<ChatSubscriptionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSubscriptionRequested&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'ChatEvent.subscriptionRequested(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $ChatSubscriptionRequestedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatSubscriptionRequestedCopyWith(ChatSubscriptionRequested value, $Res Function(ChatSubscriptionRequested) _then) = _$ChatSubscriptionRequestedCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$ChatSubscriptionRequestedCopyWithImpl<$Res>
    implements $ChatSubscriptionRequestedCopyWith<$Res> {
  _$ChatSubscriptionRequestedCopyWithImpl(this._self, this._then);

  final ChatSubscriptionRequested _self;
  final $Res Function(ChatSubscriptionRequested) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(ChatSubscriptionRequested(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatMessageSubmitted implements ChatEvent {
  const ChatMessageSubmitted({required this.text});
  

 final  String text;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageSubmittedCopyWith<ChatMessageSubmitted> get copyWith => _$ChatMessageSubmittedCopyWithImpl<ChatMessageSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageSubmitted&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ChatEvent.messageSubmitted(text: $text)';
}


}

/// @nodoc
abstract mixin class $ChatMessageSubmittedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatMessageSubmittedCopyWith(ChatMessageSubmitted value, $Res Function(ChatMessageSubmitted) _then) = _$ChatMessageSubmittedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ChatMessageSubmittedCopyWithImpl<$Res>
    implements $ChatMessageSubmittedCopyWith<$Res> {
  _$ChatMessageSubmittedCopyWithImpl(this._self, this._then);

  final ChatMessageSubmitted _self;
  final $Res Function(ChatMessageSubmitted) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(ChatMessageSubmitted(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatSendFailureDismissed implements ChatEvent {
  const ChatSendFailureDismissed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSendFailureDismissed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.sendFailureDismissed()';
}


}




/// @nodoc
mixin _$ChatState {

 String get conversationId; ChatStatus get status; List<Message> get messages;/// Send is tracked separately from [status]: a failed send must not blank
/// out a thread that is otherwise loaded and readable.
 bool get isSending; Failure? get failure; Failure? get sendFailure;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.sendFailure, sendFailure) || other.sendFailure == sendFailure));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,status,const DeepCollectionEquality().hash(messages),isSending,failure,sendFailure);

@override
String toString() {
  return 'ChatState(conversationId: $conversationId, status: $status, messages: $messages, isSending: $isSending, failure: $failure, sendFailure: $sendFailure)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 String conversationId, ChatStatus status, List<Message> messages, bool isSending, Failure? failure, Failure? sendFailure
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? status = null,Object? messages = null,Object? isSending = null,Object? failure = freezed,Object? sendFailure = freezed,}) {
  return _then(ChatState(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,sendFailure: freezed == sendFailure ? _self.sendFailure : sendFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId,  ChatStatus status,  List<Message> messages,  bool isSending,  Failure? failure,  Failure? sendFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.conversationId,_that.status,_that.messages,_that.isSending,_that.failure,_that.sendFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId,  ChatStatus status,  List<Message> messages,  bool isSending,  Failure? failure,  Failure? sendFailure)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.conversationId,_that.status,_that.messages,_that.isSending,_that.failure,_that.sendFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId,  ChatStatus status,  List<Message> messages,  bool isSending,  Failure? failure,  Failure? sendFailure)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.conversationId,_that.status,_that.messages,_that.isSending,_that.failure,_that.sendFailure);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState extends ChatState {
  const _ChatState({required this.conversationId, this.status = ChatStatus.initial,  List<Message> messages = const <Message>[], this.isSending = false, this.failure, this.sendFailure}): _messages = messages,super._();
  

@override final  String conversationId;
@override@JsonKey() final  ChatStatus status;
 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// Send is tracked separately from [status]: a failed send must not blank
/// out a thread that is otherwise loaded and readable.
@override@JsonKey() final  bool isSending;
@override final  Failure? failure;
@override final  Failure? sendFailure;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.sendFailure, sendFailure) || other.sendFailure == sendFailure));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,status,const DeepCollectionEquality().hash(_messages),isSending,failure,sendFailure);

@override
String toString() {
  return 'ChatState(conversationId: $conversationId, status: $status, messages: $messages, isSending: $isSending, failure: $failure, sendFailure: $sendFailure)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 String conversationId, ChatStatus status, List<Message> messages, bool isSending, Failure? failure, Failure? sendFailure
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? status = null,Object? messages = null,Object? isSending = null,Object? failure = freezed,Object? sendFailure = freezed,}) {
  return _then(_ChatState(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,sendFailure: freezed == sendFailure ? _self.sendFailure : sendFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
