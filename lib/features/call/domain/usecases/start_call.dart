import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Places an outgoing call to a peer.
@lazySingleton
class StartCall implements UseCase<Call, StartCallParams> {
  const StartCall(this._repository);

  final CallRepository _repository;

  @override
  ResultFuture<Call> call(StartCallParams params) =>
      _repository.startCall(peerId: params.peerId, media: params.media);
}
