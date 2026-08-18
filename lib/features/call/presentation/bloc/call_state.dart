part of 'call_bloc.dart';

enum CallStateStatus { initial, loading, ready, failure }

@freezed
abstract class CallState with _$CallState {
  const factory CallState({
    required String callId,
    @Default(CallStateStatus.initial) CallStateStatus status,

    /// Named `activeCall` rather than `call`: freezed's generated `copyWith`
    /// object is itself callable, so a field named `call` collides with it.
    Call? activeCall,
    Failure? failure,
  }) = _CallState;

  const CallState._();

  /// True once the call reached a terminal state — the screen should close.
  bool get isFinished => activeCall?.isFinished ?? false;

  CallState loading() =>
      copyWith(status: CallStateStatus.loading, failure: null);

  CallState ready(Call call) =>
      copyWith(status: CallStateStatus.ready, activeCall: call, failure: null);

  CallState failed(Failure failure) =>
      copyWith(status: CallStateStatus.failure, failure: failure);
}
