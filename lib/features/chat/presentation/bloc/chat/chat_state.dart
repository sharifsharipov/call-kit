part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required String conversationId,
    @Default(ChatStatus.initial) ChatStatus status,
    @Default(<Message>[]) List<Message> messages,

    /// Send is tracked separately from [status]: a failed send must not blank
    /// out a thread that is otherwise loaded and readable.
    @Default(false) bool isSending,
    Failure? failure,
    Failure? sendFailure,
  }) = _ChatState;

  const ChatState._();

  bool get isEmpty => status == ChatStatus.success && messages.isEmpty;

  ChatState loading() => copyWith(status: ChatStatus.loading, failure: null);

  ChatState loaded(List<Message> messages) =>
      copyWith(status: ChatStatus.success, messages: messages, failure: null);

  ChatState failed(Failure failure) =>
      copyWith(status: ChatStatus.failure, failure: failure);

  ChatState sending() => copyWith(isSending: true, sendFailure: null);

  ChatState sent() => copyWith(isSending: false);

  ChatState sendFailed(Failure failure) =>
      copyWith(isSending: false, sendFailure: failure);

  ChatState sendFailureAcknowledged() => copyWith(sendFailure: null);
}
