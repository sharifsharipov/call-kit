import 'package:freezed_annotation/freezed_annotation.dart';

part 'call.freezed.dart';

enum CallDirection { incoming, outgoing }

enum CallMedia { audio, video }

/// Signalling lifecycle. [ringing] and [connecting] are transient; the three
/// terminal states are kept distinct because the UI and the call log treat a
/// declined call differently from a failed one.
enum CallStatus { ringing, connecting, active, ended, declined, failed }

/// A call session as the business layer understands it.
///
/// Device-media flags live here rather than in the BLoC because they are
/// session state owned by the signalling backend, not view state: they must
/// survive a rebuild and stay correct if the call is answered on another
/// device.
@freezed
abstract class Call with _$Call {
  const factory Call({
    required String id,
    required String peerId,
    required String peerName,
    required CallDirection direction,
    required CallMedia media,
    required CallStatus status,
    required DateTime createdAt,
    String? peerAvatarUrl,
    DateTime? connectedAt,
    @Default(true) bool isMicrophoneEnabled,
    @Default(false) bool isSpeakerEnabled,
    @Default(true) bool isCameraEnabled,
    @Default(true) bool isFrontCamera,
  }) = _Call;

  const Call._();

  bool get isVideo => media == CallMedia.video;

  bool get isActive => status == CallStatus.active;

  bool get isFinished => switch (status) {
    CallStatus.ended || CallStatus.declined || CallStatus.failed => true,
    CallStatus.ringing || CallStatus.connecting || CallStatus.active => false,
  };

  /// Elapsed talk time, measured from the moment the media session connected.
  /// Returns [Duration.zero] before that, so the UI never shows a timer for a
  /// call that has not been answered.
  Duration elapsedAt(DateTime now) {
    final DateTime? start = connectedAt;
    if (start == null || now.isBefore(start)) {
      return Duration.zero;
    }
    return now.difference(start);
  }
}
