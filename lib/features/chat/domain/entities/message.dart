import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

/// Delivery lifecycle of a single message, from optimistic insert to read.
enum MessageStatus { sending, sent, delivered, read, failed }

/// A chat message as the business layer understands it.
///
/// Immutable and framework-free: no Firestore, no widgets, no JSON.
@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String authorId,
    required String text,
    required DateTime sentAt,
    @Default(MessageStatus.sent) MessageStatus status,
  }) = _Message;

  const Message._();

  bool isAuthoredBy(String userId) => authorId == userId;
}
