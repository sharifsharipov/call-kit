import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/config/env.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/call.dart';
import '../models/call_model.dart';
import 'call_remote_data_source.dart';

@LazySingleton(as: CallRemoteDataSource)
@Environment(Env.demo)
class InMemoryCallRemoteDataSource implements CallRemoteDataSource {
  InMemoryCallRemoteDataSource() {
    _calls[Env.demoIncomingCallId] = CallModel(
      id: Env.demoIncomingCallId,
      peerId: 'u-dilnoza',
      peerName: 'Dilnoza Karimova',
      direction: CallDirection.incoming,
      media: CallMedia.video,
      status: CallStatus.ringing,
      createdAt: DateTime.now(),
    );
  }

  static const Duration _peerAnswerDelay = Duration(seconds: 3);
  static const Duration _connectDelay = Duration(milliseconds: 900);

  final Map<String, CallModel> _calls = <String, CallModel>{};
  final Map<String, StreamController<CallModel>> _controllers =
      <String, StreamController<CallModel>>{};
  final Map<String, Timer> _timers = <String, Timer>{};

  int _idSeed = 0;

  @override
  Stream<CallModel> watchCall({required String callId}) async* {
    final CallModel? current = _calls[callId];
    if (current == null) {
      throw NotFoundException('Call $callId no longer exists.');
    }
    yield current;
    yield* _controllerFor(callId).stream;
  }

  @override
  Future<CallModel> startCall({
    required String peerId,
    required CallMedia media,
  }) async {
    final String id = 'call-${_idSeed++}';
    final CallModel call = CallModel(
      id: id,
      peerId: peerId,
      peerName: _displayName(peerId),
      direction: CallDirection.outgoing,
      media: media,
      status: CallStatus.ringing,
      createdAt: DateTime.now(),
      isCameraEnabled: media == CallMedia.video,
    );
    _calls[id] = call;
    _schedule(id, _peerAnswerDelay, () => _connect(id));
    return call;
  }

  @override
  Future<CallModel> acceptCall({required String callId}) async {
    final CallModel call = _require(callId);
    _schedule(callId, _connectDelay, () => _connect(callId));
    return _emit(call.copyWith(status: CallStatus.connecting));
  }

  @override
  Future<CallModel> declineCall({required String callId}) async =>
      _terminate(callId, CallStatus.declined);

  @override
  Future<CallModel> endCall({required String callId}) async =>
      _terminate(callId, CallStatus.ended);

  @override
  Future<CallModel> updateMedia({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  }) async {
    final CallModel call = _require(callId);
    return _emit(
      call.copyWith(
        isMicrophoneEnabled: isMicrophoneEnabled ?? call.isMicrophoneEnabled,
        isSpeakerEnabled: isSpeakerEnabled ?? call.isSpeakerEnabled,
        isCameraEnabled: isCameraEnabled ?? call.isCameraEnabled,
        isFrontCamera: isFrontCamera ?? call.isFrontCamera,
      ),
    );
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    for (final Timer timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    for (final StreamController<CallModel> controller in _controllers.values) {
      await controller.close();
    }
    _controllers.clear();
  }

  void _connect(String callId) {
    final CallModel? call = _calls[callId];
    if (call == null || call.toEntity().isFinished) {
      return;
    }
    _emit(
      call.copyWith(status: CallStatus.active, connectedAt: DateTime.now()),
    );
  }

  CallModel _terminate(String callId, CallStatus status) {
    _timers.remove(callId)?.cancel();
    return _emit(_require(callId).copyWith(status: status));
  }

  void _schedule(String callId, Duration delay, void Function() action) {
    _timers.remove(callId)?.cancel();
    _timers[callId] = Timer(delay, () {
      _timers.remove(callId);
      action();
    });
  }

  CallModel _emit(CallModel model) {
    _calls[model.id] = model;
    final StreamController<CallModel>? controller = _controllers[model.id];
    if (controller != null && !controller.isClosed) {
      controller.add(model);
    }
    return model;
  }

  CallModel _require(String callId) {
    final CallModel? call = _calls[callId];
    if (call == null) {
      throw NotFoundException('Call $callId no longer exists.');
    }
    return call;
  }

  StreamController<CallModel> _controllerFor(String callId) =>
      _controllers.putIfAbsent(callId, StreamController<CallModel>.broadcast);

  static String _displayName(String peerId) => switch (peerId) {
    'u-dilnoza' => 'Dilnoza Karimova',
    'u-bekzod' => 'Bekzod Rustamov',
    'u-madina' => 'Madina Yusupova',
    'u-jasur' => 'Jasur Toshmatov',
    'u-nilufar' => 'Nilufar Ergasheva',
    _ => 'Unknown caller',
  };
}
