import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/epoch_millis_converter.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/call.dart';

part 'call_model.freezed.dart';
part 'call_model.g.dart';

/// Wire representation of a [Call].
@freezed
abstract class CallModel with _$CallModel {
  const factory CallModel({
    required String id,
    required String peerId,
    required String peerName,
    @JsonKey(unknownEnumValue: CallDirection.incoming)
    required CallDirection direction,
    @JsonKey(unknownEnumValue: CallMedia.audio) required CallMedia media,
    @JsonKey(unknownEnumValue: CallStatus.ringing) required CallStatus status,
    @EpochMillisConverter() required DateTime createdAt,
    String? peerAvatarUrl,
    @NullableEpochMillisConverter() DateTime? connectedAt,
    @Default(true) bool isMicrophoneEnabled,
    @Default(false) bool isSpeakerEnabled,
    @Default(true) bool isCameraEnabled,
    @Default(true) bool isFrontCamera,
  }) = _CallModel;

  const CallModel._();

  factory CallModel.fromJson(DataMap json) => _$CallModelFromJson(json);

  factory CallModel.fromDoc(String id, DataMap data) =>
      CallModel.fromJson(<String, dynamic>{...data, 'id': id});

  factory CallModel.fromEntity(Call entity) => CallModel(
    id: entity.id,
    peerId: entity.peerId,
    peerName: entity.peerName,
    peerAvatarUrl: entity.peerAvatarUrl,
    direction: entity.direction,
    media: entity.media,
    status: entity.status,
    createdAt: entity.createdAt,
    connectedAt: entity.connectedAt,
    isMicrophoneEnabled: entity.isMicrophoneEnabled,
    isSpeakerEnabled: entity.isSpeakerEnabled,
    isCameraEnabled: entity.isCameraEnabled,
    isFrontCamera: entity.isFrontCamera,
  );

  Call toEntity() => Call(
    id: id,
    peerId: peerId,
    peerName: peerName,
    peerAvatarUrl: peerAvatarUrl,
    direction: direction,
    media: media,
    status: status,
    createdAt: createdAt,
    connectedAt: connectedAt,
    isMicrophoneEnabled: isMicrophoneEnabled,
    isSpeakerEnabled: isSpeakerEnabled,
    isCameraEnabled: isCameraEnabled,
    isFrontCamera: isFrontCamera,
  );

  DataMap toDoc() => toJson()..remove('id');
}
