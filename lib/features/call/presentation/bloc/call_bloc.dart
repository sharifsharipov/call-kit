import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/call.dart';
import '../../domain/usecases/accept_call.dart';
import '../../domain/usecases/call_params.dart';
import '../../domain/usecases/decline_call.dart';
import '../../domain/usecases/end_call.dart';
import '../../domain/usecases/update_call_media.dart';
import '../../domain/usecases/watch_call.dart';

part 'call_bloc.freezed.dart';
part 'call_event.dart';
part 'call_state.dart';

/// Drives both call screens.
///
/// The incoming and ongoing pages are two views of the same session, so they
/// share one BLoC rather than duplicating the signalling wiring.
@injectable
class CallBloc extends Bloc<CallEvent, CallState> {
  CallBloc(
    @factoryParam String callId,
    this._watchCall,
    this._acceptCall,
    this._declineCall,
    this._endCall,
    this._updateCallMedia,
  ) : super(CallState(callId: callId)) {
    on<CallSubscriptionRequested>(
      _onSubscriptionRequested,
      transformer: restartable(),
    );
    // Terminal actions are droppable: a double tap on "decline" must not fire
    // two signalling writes.
    on<CallAnswered>(_onAnswered, transformer: droppable());
    on<CallRejected>(_onRejected, transformer: droppable());
    on<CallHungUp>(_onHungUp, transformer: droppable());
    on<CallMediaToggled>(_onMediaToggled, transformer: sequential());
  }

  final WatchCall _watchCall;
  final AcceptCall _acceptCall;
  final DeclineCall _declineCall;
  final EndCall _endCall;
  final UpdateCallMedia _updateCallMedia;

  Future<void> _onSubscriptionRequested(
    CallSubscriptionRequested event,
    Emitter<CallState> emit,
  ) async {
    emit(state.loading());

    await emit.forEach<Either<Failure, Call>>(
      _watchCall(CallIdParams(callId: event.callId)),
      onData: (Either<Failure, Call> result) =>
          result.fold(state.failed, state.ready),
    );
  }

  Future<void> _onAnswered(CallAnswered event, Emitter<CallState> emit) =>
      _run(emit, () => _acceptCall(CallIdParams(callId: state.callId)));

  Future<void> _onRejected(CallRejected event, Emitter<CallState> emit) =>
      _run(emit, () => _declineCall(CallIdParams(callId: state.callId)));

  Future<void> _onHungUp(CallHungUp event, Emitter<CallState> emit) =>
      _run(emit, () => _endCall(CallIdParams(callId: state.callId)));

  Future<void> _onMediaToggled(
    CallMediaToggled event,
    Emitter<CallState> emit,
  ) async {
    final Call? call = state.activeCall;
    if (call == null) {
      return;
    }

    final UpdateCallMediaParams params = switch (event.control) {
      CallMediaControl.microphone => UpdateCallMediaParams(
        callId: call.id,
        isMicrophoneEnabled: !call.isMicrophoneEnabled,
      ),
      CallMediaControl.speaker => UpdateCallMediaParams(
        callId: call.id,
        isSpeakerEnabled: !call.isSpeakerEnabled,
      ),
      CallMediaControl.camera => UpdateCallMediaParams(
        callId: call.id,
        isCameraEnabled: !call.isCameraEnabled,
      ),
      CallMediaControl.cameraFacing => UpdateCallMediaParams(
        callId: call.id,
        isFrontCamera: !call.isFrontCamera,
      ),
    };

    await _run(emit, () => _updateCallMedia(params));
  }

  /// Applies a one-shot action's result. The success value is emitted directly
  /// so the button reacts immediately, while the subscription remains the
  /// authority for anything the remote peer changes.
  Future<void> _run(
    Emitter<CallState> emit,
    Future<Either<Failure, Call>> Function() action,
  ) async {
    final Either<Failure, Call> result = await action();
    emit(result.fold(state.failed, state.ready));
  }
}
