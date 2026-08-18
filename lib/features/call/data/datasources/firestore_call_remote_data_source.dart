import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/env.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/firebase_exception_mapper.dart';
import '../../../../core/session/session_provider.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/call.dart';
import '../models/call_model.dart';
import 'call_remote_data_source.dart';

@LazySingleton(as: CallRemoteDataSource)
@Environment(Env.firebase)
class FirestoreCallRemoteDataSource implements CallRemoteDataSource {
  const FirestoreCallRemoteDataSource(this._firestore, this._session);

  static const String _calls = 'calls';

  final FirebaseFirestore _firestore;
  final SessionProvider _session;

  @override
  Stream<CallModel> watchCall({required String callId}) {
    return _callRef(callId)
        .snapshots()
        .map((DocumentSnapshot<DataMap> doc) {
          final DataMap? data = doc.data();
          if (data == null) {
            throw NotFoundException('Call $callId no longer exists.');
          }
          return CallModel.fromDoc(doc.id, _normalize(data));
        })
        .handleError(_rethrowAsAppException);
  }

  @override
  Future<CallModel> startCall({
    required String peerId,
    required CallMedia media,
  }) => _guard(() async {
    final DocumentReference<DataMap> ref = _firestore.collection(_calls).doc();
    final String userId = _session.current.id;
    final CallModel call = CallModel(
      id: ref.id,
      peerId: peerId,
      peerName: '',
      direction: CallDirection.outgoing,
      media: media,
      status: CallStatus.ringing,
      createdAt: DateTime.now(),
      isCameraEnabled: media == CallMedia.video,
    );
    await ref.set(<String, dynamic>{
      ...call.toDoc(),
      'callerId': userId,
      'participantIds': <String>[userId, peerId],
    });
    return call;
  });

  @override
  Future<CallModel> acceptCall({required String callId}) =>
      _transition(callId, <String, dynamic>{
        'status': CallStatus.connecting.name,
        'connectedAt': DateTime.now().toUtc().millisecondsSinceEpoch,
      });

  @override
  Future<CallModel> declineCall({required String callId}) => _transition(
    callId,
    <String, dynamic>{'status': CallStatus.declined.name},
  );

  @override
  Future<CallModel> endCall({required String callId}) =>
      _transition(callId, <String, dynamic>{'status': CallStatus.ended.name});

  @override
  Future<CallModel> updateMedia({
    required String callId,
    bool? isMicrophoneEnabled,
    bool? isSpeakerEnabled,
    bool? isCameraEnabled,
    bool? isFrontCamera,
  }) => _transition(callId, <String, dynamic>{
    'isMicrophoneEnabled': ?isMicrophoneEnabled,
    'isSpeakerEnabled': ?isSpeakerEnabled,
    'isCameraEnabled': ?isCameraEnabled,
    'isFrontCamera': ?isFrontCamera,
  });

  Future<CallModel> _transition(String callId, DataMap patch) =>
      _guard(() async {
        final DocumentReference<DataMap> ref = _callRef(callId);
        if (patch.isNotEmpty) {
          await ref.update(patch);
        }
        final DocumentSnapshot<DataMap> doc = await ref.get();
        final DataMap? data = doc.data();
        if (data == null) {
          throw NotFoundException('Call $callId no longer exists.');
        }
        return CallModel.fromDoc(doc.id, _normalize(data));
      });

  @override
  Future<void> dispose() async {
    // Snapshot subscriptions are owned by the callers, so there is nothing
    // held here to release.
  }

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on FirebaseException catch (error) {
      throw mapFirebaseException(error);
    }
  }

  DocumentReference<DataMap> _callRef(String callId) =>
      _firestore.collection(_calls).doc(callId);

  static DataMap _normalize(DataMap data) => data.map(
    (String key, dynamic value) => MapEntry<String, dynamic>(
      key,
      value is Timestamp ? value.millisecondsSinceEpoch : value,
    ),
  );

  static Never _rethrowAsAppException(Object error) {
    if (error is FirebaseException) {
      throw mapFirebaseException(error);
    }
    if (error is AppException) {
      throw error;
    }
    throw ServerException(error.toString());
  }
}
