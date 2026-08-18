import 'package:injectable/injectable.dart';

import '../../../../core/error/result_guard.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/call.dart';
import '../../domain/repositories/call_repository.dart';
import '../datasources/call_remote_data_source.dart';
import '../models/call_model.dart';

/// Maps signalling exceptions onto domain failures and DTOs onto entities.
@LazySingleton(as: CallRepository)
class CallRepositoryImpl implements CallRepository {
  const CallRepositoryImpl(this._remote);

  final CallRemoteDataSource _remote;

  @override
  ResultStream<Call> watchCall({required String callId}) => guardStream(
    () => _remote
        .watchCall(callId: callId)
        .map((CallModel model) => model.toEntity()),
  );

  @override
  ResultFuture<Call> startCall({
    required String peerId,
    required CallMedia media,
  }) => _guarded(() => _remote.startCall(peerId: peerId, media: media));

  @override
  ResultFuture<Call> acceptCall({required String callId}) =>
      _guarded(() => _remote.acceptCall(callId: callId));

  @override
  ResultFuture<Call> declineCall({required String callId}) =>
      _guarded(() => _remote.declineCall(callId: callId));

  @override
  ResultFuture<Call> endCall({required String callId}) =>
      _guarded(() => _remote.endCall(callId: callId));

  @override
  ResultFuture<Call> updateMedia({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  }) => _guarded(
    () => _remote.updateMedia(
      callId: callId,
      isMicrophoneEnabled: isMicrophoneEnabled,
      isSpeakerEnabled: isSpeakerEnabled,
      isCameraEnabled: isCameraEnabled,
      isFrontCamera: isFrontCamera,
    ),
  );

  ResultFuture<Call> _guarded(Future<CallModel> Function() action) =>
      guardFuture(() async => (await action()).toEntity());
}
