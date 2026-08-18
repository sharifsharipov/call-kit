import 'package:injectable/injectable.dart';

import '../../../../core/error/result_guard.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/conversation_model.dart';
import '../models/message_model.dart';

/// Turns transport-level exceptions into domain failures and DTOs into
/// entities — and nothing else.
///
/// Deliberately thin: business rules live in a use case, transport details
/// live in a data source.
@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._remote);

  final ChatRemoteDataSource _remote;

  @override
  ResultStream<List<Conversation>> watchConversations({
    required String userId,
  }) => guardStream(
    () => _remote
        .watchConversations(userId: userId)
        .map(
          (List<ConversationModel> models) => models
              .map((ConversationModel model) => model.toEntity())
              .toList(growable: false),
        ),
  );

  @override
  ResultStream<List<Message>> watchMessages({required String conversationId}) =>
      guardStream(
        () => _remote
            .watchMessages(conversationId: conversationId)
            .map(
              (List<MessageModel> models) => models
                  .map((MessageModel model) => model.toEntity())
                  .toList(growable: false),
            ),
      );

  @override
  ResultFuture<Message> sendMessage({
    required String conversationId,
    required String authorId,
    required String text,
  }) => guardFuture(() async {
    final MessageModel model = await _remote.sendMessage(
      conversationId: conversationId,
      authorId: authorId,
      text: text,
    );
    return model.toEntity();
  });
}
