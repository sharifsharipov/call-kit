import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/env.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/firebase_exception_mapper.dart';
import '../../../../core/utils/typedefs.dart';
import '../models/conversation_model.dart';
import '../models/message_model.dart';
import 'chat_remote_data_source.dart';

/// Firestore-backed chat transport.
///
/// Layout:
///   conversations/{conversationId}            — inbox entries
///   conversations/{conversationId}/messages/* — the thread
@LazySingleton(as: ChatRemoteDataSource)
@Environment(Env.firebase)
class FirestoreChatRemoteDataSource implements ChatRemoteDataSource {
  const FirestoreChatRemoteDataSource(this._firestore);

  static const String _conversations = 'conversations';
  static const String _messages = 'messages';

  final FirebaseFirestore _firestore;

  @override
  Stream<List<ConversationModel>> watchConversations({required String userId}) {
    return _firestore
        .collection(_conversations)
        .where('participantIds', arrayContains: userId)
        .orderBy('lastMessageAt', descending: true)
        .snapshots()
        .map(
          (QuerySnapshot<DataMap> snapshot) => snapshot.docs
              .map(
                (QueryDocumentSnapshot<DataMap> doc) =>
                    ConversationModel.fromDoc(doc.id, _normalize(doc.data())),
              )
              .toList(growable: false),
        )
        .handleError(_rethrowAsAppException);
  }

  @override
  Stream<List<MessageModel>> watchMessages({required String conversationId}) {
    return _threadRef(conversationId)
        .orderBy('sentAt')
        .snapshots()
        .map(
          (QuerySnapshot<DataMap> snapshot) => snapshot.docs
              .map(
                (QueryDocumentSnapshot<DataMap> doc) =>
                    MessageModel.fromDoc(doc.id, _normalize(doc.data())),
              )
              .toList(growable: false),
        )
        .handleError(_rethrowAsAppException);
  }

  @override
  Future<MessageModel> sendMessage({
    required String conversationId,
    required String authorId,
    required String text,
  }) async {
    try {
      final DocumentReference<DataMap> ref = _threadRef(conversationId).doc();
      final MessageModel message = MessageModel(
        id: ref.id,
        conversationId: conversationId,
        authorId: authorId,
        text: text,
        sentAt: DateTime.now(),
      );

      // One atomic write: the thread document and the inbox preview must never
      // disagree about what the last message was.
      final WriteBatch batch = _firestore.batch()
        ..set(ref, message.toDoc())
        ..update(
          _firestore.collection(_conversations).doc(conversationId),
          <String, dynamic>{
            'lastMessagePreview': text,
            'lastMessageAt': message.sentAt.toUtc().millisecondsSinceEpoch,
          },
        );
      await batch.commit();

      return message;
    } on FirebaseException catch (error) {
      throw mapFirebaseException(error);
    }
  }

  @override
  Future<void> dispose() async {
    // Snapshot subscriptions are owned by the callers, so there is nothing
    // held here to release.
  }

  CollectionReference<DataMap> _threadRef(String conversationId) => _firestore
      .collection(_conversations)
      .doc(conversationId)
      .collection(_messages);

  /// Firestore hands back [Timestamp]s; the models speak epoch millis so they
  /// stay testable without a Firebase dependency.
  static DataMap _normalize(DataMap data) => data.map(
    (String key, dynamic value) => MapEntry<String, dynamic>(
      key,
      value is Timestamp ? value.millisecondsSinceEpoch : value,
    ),
  );

  static Never _rethrowAsAppException(Object error) {
    if (error is FirebaseException) {
      throw mapFirebaseException(error);
    }
    throw ServerException(error.toString());
  }
}
