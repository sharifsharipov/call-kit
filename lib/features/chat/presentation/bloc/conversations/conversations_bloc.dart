import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/conversation.dart';
import '../../../domain/usecases/watch_conversations.dart';

part 'conversations_bloc.freezed.dart';
part 'conversations_event.dart';
part 'conversations_state.dart';

/// Owns the inbox list. Depends on a use case, never on a repository or a
/// data source, so it is trivially testable with a mocked use case.
@injectable
class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  ConversationsBloc(this._watchConversations)
    : super(const ConversationsState()) {
    on<ConversationsSubscriptionRequested>(
      _onSubscriptionRequested,
      // A second request replaces the first subscription instead of running
      // both, which is what prevents duplicate emissions after a retry.
      transformer: restartable(),
    );
  }

  final WatchConversations _watchConversations;

  Future<void> _onSubscriptionRequested(
    ConversationsSubscriptionRequested event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(state.loading());

    // `emit.forEach` ties the subscription to the handler's lifetime, so the
    // stream is cancelled on close or restart without a manual subscription.
    await emit.forEach<Either<Failure, List<Conversation>>>(
      _watchConversations(WatchConversationsParams(userId: event.userId)),
      onData: (Either<Failure, List<Conversation>> result) =>
          result.fold(state.failed, state.loaded),
    );
  }
}
