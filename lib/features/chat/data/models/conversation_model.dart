import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/epoch_millis_converter.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/conversation.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

/// Wire representation of a [Conversation].
@freezed
abstract class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required String id,
    required String peerId,
    required String peerName,
    @EpochMillisConverter() required DateTime lastMessageAt,
    String? peerAvatarUrl,
    @Default('') String lastMessagePreview,
    @Default(0) int unreadCount,
    @Default(false) bool isPeerOnline,
  }) = _ConversationModel;

  const ConversationModel._();

  factory ConversationModel.fromJson(DataMap json) =>
      _$ConversationModelFromJson(json);

  factory ConversationModel.fromDoc(String id, DataMap data) =>
      ConversationModel.fromJson(<String, dynamic>{...data, 'id': id});

  Conversation toEntity() => Conversation(
    id: id,
    peerId: peerId,
    peerName: peerName,
    peerAvatarUrl: peerAvatarUrl,
    lastMessagePreview: lastMessagePreview,
    lastMessageAt: lastMessageAt,
    unreadCount: unreadCount,
    isPeerOnline: isPeerOnline,
  );

  DataMap toDoc() => toJson()..remove('id');
}
