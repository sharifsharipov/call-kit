import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Answers a ringing incoming call.
@lazySingleton
class AcceptCall implements UseCase<Call, CallIdParams> {
  const AcceptCall(this._repository);

  final CallRepository _repository;

  @override
  ResultFuture<Call> call(CallIdParams params) =>
      _repository.acceptCall(callId: params.callId);
}
