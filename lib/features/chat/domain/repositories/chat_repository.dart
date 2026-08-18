import '../../../../core/utils/typedefs.dart';
import '../entities/conversation.dart';
import '../entities/message.dart';

/// Domain-owned contract. The `data` layer implements it; the domain never
/// learns where the messages actually come from (DIP).
abstract interface class ChatRepository {
  ResultStream<List<Conversation>> watchConversations({required String userId});

  ResultStream<List<Message>> watchMessages({required String conversationId});

  ResultFuture<Message> sendMessage({
    required String conversationId,
    required String authorId,
    required String text,
  });
}
