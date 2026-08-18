// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: json['id'] as String,
      peerId: json['peerId'] as String,
      peerName: json['peerName'] as String,
      lastMessageAt: const EpochMillisConverter().fromJson(
        (json['lastMessageAt'] as num).toInt(),
      ),
      peerAvatarUrl: json['peerAvatarUrl'] as String?,
      lastMessagePreview: json['lastMessagePreview'] as String? ?? '',
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isPeerOnline: json['isPeerOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$ConversationModelToJson(
  _ConversationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'peerId': instance.peerId,
  'peerName': instance.peerName,
  'lastMessageAt': const EpochMillisConverter().toJson(instance.lastMessageAt),
  'peerAvatarUrl': instance.peerAvatarUrl,
  'lastMessagePreview': instance.lastMessagePreview,
  'unreadCount': instance.unreadCount,
  'isPeerOnline': instance.isPeerOnline,
};
