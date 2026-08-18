import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';

/// Domain-owned contract for call signalling and device media.
///
/// Swapping Firestore signalling for a native WebRTC engine later is an
/// implementation change behind this interface, not a domain change.
abstract interface class CallRepository {
  /// Emits every state transition of [callId] until it terminates.
  ResultStream<Call> watchCall({required String callId});

  ResultFuture<Call> startCall({
    required String peerId,
    required CallMedia media,
  });

  ResultFuture<Call> acceptCall({required String callId});

  ResultFuture<Call> declineCall({required String callId});

  ResultFuture<Call> endCall({required String callId});

  /// Partial update of the device media flags. `null` means "leave unchanged",
  /// which keeps four toggles on one endpoint instead of four near-identical
  /// ones.
  ResultFuture<Call> updateMedia({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  });
}
