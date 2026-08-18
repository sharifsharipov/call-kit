import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';
import 'call_params.dart';

/// Rejects a ringing incoming call.
@lazySingleton
class DeclineCall implements UseCase<Call, CallIdParams> {
  const DeclineCall(this._repository);

  final CallRepository _repository;

  @override
  ResultFuture<Call> call(CallIdParams params) =>
      _repository.declineCall(callId: params.callId);
}
