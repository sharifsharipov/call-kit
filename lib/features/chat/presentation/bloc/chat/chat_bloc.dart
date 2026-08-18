import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/session/session_provider.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/usecases/send_message.dart';
import '../../../domain/usecases/watch_messages.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

/// Owns a single conversation thread.
@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    @factoryParam String conversationId,
    this._session,
    this._watchMessages,
    this._sendMessage,
  ) : super(ChatState(conversationId: conversationId)) {
    on<ChatSubscriptionRequested>(
      _onSubscriptionRequested,
      transformer: restartable(),
    );
    // Sends are sequential so two fast taps cannot interleave and land out of
    // order in the thread.
    on<ChatMessageSubmitted>(_onMessageSubmitted, transformer: sequential());
    on<ChatSendFailureDismissed>(
      (_, Emitter<ChatState> emit) => emit(state.sendFailureAcknowledged()),
    );
  }

  final SessionProvider _session;
  final WatchMessages _watchMessages;
  final SendMessage _sendMessage;

  Future<void> _onSubscriptionRequested(
    ChatSubscriptionRequested event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.loading());

    await emit.forEach<Either<Failure, List<Message>>>(
      _watchMessages(WatchMessagesParams(conversationId: event.conversationId)),
      onData: (Either<Failure, List<Message>> result) =>
          result.fold(state.failed, state.loaded),
    );
  }

  Future<void> _onMessageSubmitted(
    ChatMessageSubmitted event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.sending());

    final Either<Failure, Message> result = await _sendMessage(
      SendMessageParams(
        conversationId: state.conversationId,
        authorId: _session.current.id,
        text: event.text,
      ),
    );

    emit(
      result.fold(
        state.sendFailed,
        // The sent message arrives through the subscription, so there is
        // nothing to append here — one source of truth for the thread.
        (_) => state.sent(),
      ),
    );
  }
}
