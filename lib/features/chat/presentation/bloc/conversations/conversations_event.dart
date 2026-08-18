part of 'conversations_bloc.dart';

@freezed
sealed class ConversationsEvent with _$ConversationsEvent {
  /// Starts (or restarts) the inbox subscription for a user.
  const factory ConversationsEvent.subscriptionRequested({
    required String userId,
  }) = ConversationsSubscriptionRequested;
}
