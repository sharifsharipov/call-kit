import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/call.dart';

part 'call_params.freezed.dart';

/// Shared by every use case that addresses an existing call.
@freezed
abstract class CallIdParams with _$CallIdParams {
  const factory CallIdParams({required String callId}) = _CallIdParams;
}

@freezed
abstract class StartCallParams with _$StartCallParams {
  const factory StartCallParams({
    required String peerId,
    required CallMedia media,
  }) = _StartCallParams;
}

@freezed
abstract class UpdateCallMediaParams with _$UpdateCallMediaParams {
  const factory UpdateCallMediaParams({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  }) = _UpdateCallMediaParams;
}
