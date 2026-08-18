import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Streams every state transition of a call.
@lazySingleton
class WatchCall implements StreamUseCase<Call, CallIdParams> {
  const WatchCall(this._repository);

  final CallRepository _repository;

  @override
  ResultStream<Call> call(CallIdParams params) =>
      _repository.watchCall(callId: params.callId);
}
