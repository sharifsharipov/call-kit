import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Applies a partial change to the device media flags (mic, speaker, camera).
@lazySingleton
class UpdateCallMedia implements UseCase<Call, UpdateCallMediaParams> {
  const UpdateCallMedia(this._repository);

  final CallRepository _repository;

  @override
  ResultFuture<Call> call(UpdateCallMediaParams params) =>
      _repository.updateMedia(
        callId: params.callId,
        isMicrophoneEnabled: params.isMicrophoneEnabled,
        isSpeakerEnabled: params.isSpeakerEnabled,
        isCameraEnabled: params.isCameraEnabled,
        isFrontCamera: params.isFrontCamera,
      );
}
