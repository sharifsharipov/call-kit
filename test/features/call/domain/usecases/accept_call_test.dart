import 'package:callkit_example/core/error/failures.dart';
import 'package:callkit_example/features/call/domain/entities/call.dart';
import 'package:callkit_example/features/call/domain/repositories/call_repository.dart';
import 'package:callkit_example/features/call/domain/usecases/accept_call.dart';
import 'package:callkit_example/features/call/domain/usecases/call_params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockCallRepository extends Mock implements CallRepository {}

void main() {
  late _MockCallRepository repository;
  late AcceptCall usecase;

  final Call connecting = Call(
    id: 'call-1',
    peerId: 'u1',
    peerName: 'Dilnoza',
    direction: CallDirection.incoming,
    media: CallMedia.video,
    status: CallStatus.connecting,
    createdAt: DateTime(2026, 8, 18, 10),
  );

  setUp(() {
    repository = _MockCallRepository();
    usecase = AcceptCall(repository);
  });

  test('forwards the call id and returns the updated call', () async {
    when(() => repository.acceptCall(callId: 'call-1'))
        .thenAnswer((_) async => Right<Failure, Call>(connecting));

    final Either<Failure, Call> result = await usecase(
      const CallIdParams(callId: 'call-1'),
    );

    expect(result.getRight().toNullable(), connecting);
    verify(() => repository.acceptCall(callId: 'call-1')).called(1);
  });

  test('passes a repository failure through untouched', () async {
    when(() => repository.acceptCall(callId: 'call-1'))
        .thenAnswer((_) async => const Left<Failure, Call>(NetworkFailure()));

    final Either<Failure, Call> result = await usecase(
      const CallIdParams(callId: 'call-1'),
    );

    expect(result.getLeft().toNullable(), const NetworkFailure());
  });
}
