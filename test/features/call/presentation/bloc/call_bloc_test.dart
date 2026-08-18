import 'package:bloc_test/bloc_test.dart';
import 'package:callkit_example/core/error/failures.dart';
import 'package:callkit_example/features/call/domain/entities/call.dart';
import 'package:callkit_example/features/call/domain/usecases/accept_call.dart';
import 'package:callkit_example/features/call/domain/usecases/call_params.dart';
import 'package:callkit_example/features/call/domain/usecases/decline_call.dart';
import 'package:callkit_example/features/call/domain/usecases/end_call.dart';
import 'package:callkit_example/features/call/domain/usecases/update_call_media.dart';
import 'package:callkit_example/features/call/domain/usecases/watch_call.dart';
import 'package:callkit_example/features/call/presentation/bloc/call_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockWatchCall extends Mock implements WatchCall {}

class _MockAcceptCall extends Mock implements AcceptCall {}

class _MockDeclineCall extends Mock implements DeclineCall {}

class _MockEndCall extends Mock implements EndCall {}

class _MockUpdateCallMedia extends Mock implements UpdateCallMedia {}

void main() {
  late _MockWatchCall watchCall;
  late _MockAcceptCall acceptCall;
  late _MockDeclineCall declineCall;
  late _MockEndCall endCall;
  late _MockUpdateCallMedia updateCallMedia;

  final Call ringing = Call(
    id: 'call-1',
    peerId: 'u1',
    peerName: 'Dilnoza',
    direction: CallDirection.incoming,
    media: CallMedia.video,
    status: CallStatus.ringing,
    createdAt: DateTime(2026, 8, 18, 10),
  );

  setUpAll(() {
    registerFallbackValue(const CallIdParams(callId: 'call-1'));
    registerFallbackValue(const UpdateCallMediaParams(callId: 'call-1'));
  });

  setUp(() {
    watchCall = _MockWatchCall();
    acceptCall = _MockAcceptCall();
    declineCall = _MockDeclineCall();
    endCall = _MockEndCall();
    updateCallMedia = _MockUpdateCallMedia();
  });

  CallBloc buildBloc() => CallBloc(
    'call-1',
    watchCall,
    acceptCall,
    declineCall,
    endCall,
    updateCallMedia,
  );

  blocTest<CallBloc, CallState>(
    'publishes each signalling update from the stream',
    setUp: () {
      when(() => watchCall(any())).thenAnswer(
        (_) =>
            Stream<Either<Failure, Call>>.value(Right<Failure, Call>(ringing)),
      );
    },
    build: buildBloc,
    act: (CallBloc bloc) =>
        bloc.add(const CallSubscriptionRequested(callId: 'call-1')),
    expect: () => <Matcher>[
      isA<CallState>().having(
        (CallState s) => s.status,
        'status',
        CallStateStatus.loading,
      ),
      isA<CallState>()
          .having((CallState s) => s.status, 'status', CallStateStatus.ready)
          .having((CallState s) => s.activeCall, 'call', ringing),
    ],
  );

  blocTest<CallBloc, CallState>(
    'answering delegates to AcceptCall',
    setUp: () {
      when(() => acceptCall(any())).thenAnswer(
        (_) async => Right<Failure, Call>(
          ringing.copyWith(status: CallStatus.connecting),
        ),
      );
    },
    build: buildBloc,
    seed: () => CallState(
      callId: 'call-1',
      status: CallStateStatus.ready,
      activeCall: ringing,
    ),
    act: (CallBloc bloc) => bloc.add(const CallAnswered()),
    expect: () => <Matcher>[
      isA<CallState>().having(
        (CallState s) => s.activeCall?.status,
        'call.status',
        CallStatus.connecting,
      ),
    ],
    verify: (_) =>
        verify(() => acceptCall(const CallIdParams(callId: 'call-1')))
            .called(1),
  );

  blocTest<CallBloc, CallState>(
    'toggling the microphone sends the inverted flag',
    setUp: () {
      when(() => updateCallMedia(any())).thenAnswer(
        (_) async =>
            Right<Failure, Call>(ringing.copyWith(isMicrophoneEnabled: false)),
      );
    },
    build: buildBloc,
    seed: () => CallState(
      callId: 'call-1',
      status: CallStateStatus.ready,
      activeCall: ringing,
    ),
    act: (CallBloc bloc) =>
        bloc.add(const CallMediaToggled(CallMediaControl.microphone)),
    verify: (_) => verify(
      () => updateCallMedia(
        const UpdateCallMediaParams(
          callId: 'call-1',
          isMicrophoneEnabled: false,
        ),
      ),
    ).called(1),
  );

  blocTest<CallBloc, CallState>(
    'ignores a media toggle before any call has arrived',
    build: buildBloc,
    act: (CallBloc bloc) =>
        bloc.add(const CallMediaToggled(CallMediaControl.speaker)),
    expect: () => <Matcher>[],
    verify: (_) => verifyZeroInteractions(updateCallMedia),
  );
}
