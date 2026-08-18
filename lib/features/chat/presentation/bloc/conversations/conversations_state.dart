part of 'conversations_bloc.dart';

enum ConversationsStatus { initial, loading, success, failure }

@freezed
abstract class ConversationsState with _$ConversationsState {
  const factory ConversationsState({
    @Default(ConversationsStatus.initial) ConversationsStatus status,
    @Default(<Conversation>[]) List<Conversation> conversations,
    Failure? failure,
  }) = _ConversationsState;

  const ConversationsState._();

  bool get isEmpty =>
      status == ConversationsStatus.success && conversations.isEmpty;

  ConversationsState loading() =>
      copyWith(status: ConversationsStatus.loading, failure: null);

  /// A fresh snapshot clears any previous error, so a recovered stream leaves
  /// no stale message on screen.
  ConversationsState loaded(List<Conversation> conversations) =>
      ConversationsState(
        status: ConversationsStatus.success,
        conversations: conversations,
      );

  ConversationsState failed(Failure failure) =>
      copyWith(status: ConversationsStatus.failure, failure: failure);
}
