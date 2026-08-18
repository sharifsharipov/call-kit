import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Hangs up a connected or outgoing call.
@lazySingleton
class EndCall implements UseCase<Call, CallIdParams> {
  const EndCall(this._repository);

  final CallRepository _repository;

  @override
  ResultFuture<Call> call(CallIdParams params) =>
      _repository.endCall(callId: params.callId);
}
