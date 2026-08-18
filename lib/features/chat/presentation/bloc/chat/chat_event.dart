part of 'chat_bloc.dart';

@freezed
sealed class ChatEvent with _$ChatEvent {
  /// Starts (or restarts) the message subscription for a conversation.
  const factory ChatEvent.subscriptionRequested({
    required String conversationId,
  }) = ChatSubscriptionRequested;

  const factory ChatEvent.messageSubmitted({required String text}) =
      ChatMessageSubmitted;

  /// Clears a transient "could not send" banner once the user has seen it.
  const factory ChatEvent.sendFailureDismissed() = ChatSendFailureDismissed;
}
