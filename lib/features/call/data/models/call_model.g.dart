// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallModel _$CallModelFromJson(Map<String, dynamic> json) => _CallModel(
  id: json['id'] as String,
  peerId: json['peerId'] as String,
  peerName: json['peerName'] as String,
  direction: $enumDecode(
    _$CallDirectionEnumMap,
    json['direction'],
    unknownValue: CallDirection.incoming,
  ),
  media: $enumDecode(
    _$CallMediaEnumMap,
    json['media'],
    unknownValue: CallMedia.audio,
  ),
  status: $enumDecode(
    _$CallStatusEnumMap,
    json['status'],
    unknownValue: CallStatus.ringing,
  ),
  createdAt: const EpochMillisConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  peerAvatarUrl: json['peerAvatarUrl'] as String?,
  connectedAt: const NullableEpochMillisConverter().fromJson(
    (json['connectedAt'] as num?)?.toInt(),
  ),
  isMicrophoneEnabled: json['isMicrophoneEnabled'] as bool? ?? true,
  isSpeakerEnabled: json['isSpeakerEnabled'] as bool? ?? false,
  isCameraEnabled: json['isCameraEnabled'] as bool? ?? true,
  isFrontCamera: json['isFrontCamera'] as bool? ?? true,
);

Map<String, dynamic> _$CallModelToJson(_CallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'peerId': instance.peerId,
      'peerName': instance.peerName,
      'direction': _$CallDirectionEnumMap[instance.direction]!,
      'media': _$CallMediaEnumMap[instance.media]!,
      'status': _$CallStatusEnumMap[instance.status]!,
      'createdAt': const EpochMillisConverter().toJson(instance.createdAt),
      'peerAvatarUrl': instance.peerAvatarUrl,
      'connectedAt': const NullableEpochMillisConverter().toJson(
        instance.connectedAt,
      ),
      'isMicrophoneEnabled': instance.isMicrophoneEnabled,
      'isSpeakerEnabled': instance.isSpeakerEnabled,
      'isCameraEnabled': instance.isCameraEnabled,
      'isFrontCamera': instance.isFrontCamera,
    };

const _$CallDirectionEnumMap = {
  CallDirection.incoming: 'incoming',
  CallDirection.outgoing: 'outgoing',
};

const _$CallMediaEnumMap = {CallMedia.audio: 'audio', CallMedia.video: 'video'};

const _$CallStatusEnumMap = {
  CallStatus.ringing: 'ringing',
  CallStatus.connecting: 'connecting',
  CallStatus.active: 'active',
  CallStatus.ended: 'ended',
  CallStatus.declined: 'declined',
  CallStatus.failed: 'failed',
};
