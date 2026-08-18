import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/call.dart';
import '../../domain/usecases/call_params.dart';
import '../../domain/usecases/start_call.dart';

part 'call_launcher_cubit.freezed.dart';

enum CallLauncherStatus { idle, placing, placed, failure }

@freezed
abstract class CallLauncherState with _$CallLauncherState {
  const factory CallLauncherState({
    @Default(CallLauncherStatus.idle) CallLauncherStatus status,
    String? callId,
    Failure? failure,
  }) = _CallLauncherState;
}

/// Places an outgoing call and hands back its id.
///
/// Kept apart from `CallBloc`: the caller screen only needs "start this call
/// and tell me where to navigate", while `CallBloc` owns an existing session.
@injectable
class CallLauncherCubit extends Cubit<CallLauncherState> {
  CallLauncherCubit(this._startCall) : super(const CallLauncherState());

  final StartCall _startCall;

  Future<void> place({required String peerId, required CallMedia media}) async {
    if (state.status == CallLauncherStatus.placing) {
      return;
    }
    emit(const CallLauncherState(status: CallLauncherStatus.placing));

    final Either<Failure, Call> result = await _startCall(
      StartCallParams(peerId: peerId, media: media),
    );

    emit(
      result.fold(
        (Failure failure) => CallLauncherState(
          status: CallLauncherStatus.failure,
          failure: failure,
        ),
        (Call call) => CallLauncherState(
          status: CallLauncherStatus.placed,
          callId: call.id,
        ),
      ),
    );
  }

  /// Called after the navigation has been consumed so a rebuild cannot push
  /// the call screen twice.
  void reset() => emit(const CallLauncherState());
}
