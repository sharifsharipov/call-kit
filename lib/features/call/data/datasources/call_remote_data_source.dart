import '../../domain/entities/call.dart';
import '../models/call_model.dart';

/// Transport contract for call signalling.
abstract interface class CallRemoteDataSource {
  Stream<CallModel> watchCall({required String callId});

  Future<CallModel> startCall({
    required String peerId,
    required CallMedia media,
  });

  Future<CallModel> acceptCall({required String callId});

  Future<CallModel> declineCall({required String callId});

  Future<CallModel> endCall({required String callId});

  Future<CallModel> updateMedia({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  });

  Future<void> dispose();
}
