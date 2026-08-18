// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      authorId: json['authorId'] as String,
      text: json['text'] as String,
      sentAt: const EpochMillisConverter().fromJson(
        (json['sentAt'] as num).toInt(),
      ),
      status:
          $enumDecodeNullable(
            _$MessageStatusEnumMap,
            json['status'],
            unknownValue: MessageStatus.sent,
          ) ??
          MessageStatus.sent,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'authorId': instance.authorId,
      'text': instance.text,
      'sentAt': const EpochMillisConverter().toJson(instance.sentAt),
      'status': _$MessageStatusEnumMap[instance.status]!,
    };

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};
