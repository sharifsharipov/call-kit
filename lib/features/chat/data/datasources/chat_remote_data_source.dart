import '../models/conversation_model.dart';
import '../models/message_model.dart';

/// Transport contract for chat.
///
/// Implementations throw `AppException`s; translating those into failures is
/// the repository's job, not the caller's.
abstract interface class ChatRemoteDataSource {
  Stream<List<ConversationModel>> watchConversations({required String userId});

  Stream<List<MessageModel>> watchMessages({required String conversationId});

  Future<MessageModel> sendMessage({
    required String conversationId,
    required String authorId,
    required String text,
  });

  /// Releases any resources the transport holds. Part of the contract because
  /// the container disposes what it created, and it must not need to know
  /// which implementation it is holding.
  Future<void> dispose();
}
