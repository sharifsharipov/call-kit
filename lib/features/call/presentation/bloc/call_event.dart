part of 'call_bloc.dart';

enum CallMediaControl { microphone, speaker, camera, cameraFacing }

@freezed
sealed class CallEvent with _$CallEvent {
  const factory CallEvent.subscriptionRequested({required String callId}) =
      CallSubscriptionRequested;

  const factory CallEvent.answered() = CallAnswered;

  const factory CallEvent.rejected() = CallRejected;

  const factory CallEvent.hungUp() = CallHungUp;

  /// One event for all four device-media toggles: they share a single endpoint
  /// and identical handling, so separate events would be duplication.
  const factory CallEvent.mediaToggled(CallMediaControl control) =
      CallMediaToggled;
}
