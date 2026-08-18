import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

/// A one-to-one conversation shown in the inbox list.
@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String peerId,
    required String peerName,
    required DateTime lastMessageAt,
    String? peerAvatarUrl,
    @Default('') String lastMessagePreview,
    @Default(0) int unreadCount,
    @Default(false) bool isPeerOnline,
  }) = _Conversation;

  const Conversation._();

  bool get hasUnread => unreadCount > 0;
}
