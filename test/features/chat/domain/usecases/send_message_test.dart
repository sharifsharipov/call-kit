import 'package:callkit_example/core/error/failures.dart';
import 'package:callkit_example/features/chat/domain/entities/message.dart';
import 'package:callkit_example/features/chat/domain/repositories/chat_repository.dart';
import 'package:callkit_example/features/chat/domain/usecases/send_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late _MockChatRepository repository;
  late SendMessage usecase;

  final Message sent = Message(
    id: 'm1',
    conversationId: 'c1',
    authorId: 'me',
    text: 'hello',
    sentAt: DateTime(2026, 8, 18, 10),
  );

  setUp(() {
    repository = _MockChatRepository();
    usecase = SendMessage(repository);
  });

  void stubSuccess() {
    when(
      () => repository.sendMessage(
        conversationId: any(named: 'conversationId'),
        authorId: any(named: 'authorId'),
        text: any(named: 'text'),
      ),
    ).thenAnswer((_) async => Right<Failure, Message>(sent));
  }

  group('SendMessage', () {
    test('delegates a valid message to the repository', () async {
      stubSuccess();

      final Either<Failure, Message> result = await usecase(
        const SendMessageParams(
          conversationId: 'c1',
          authorId: 'me',
          text: 'hello',
        ),
      );

      expect(result, Right<Failure, Message>(sent));
      verify(
        () => repository.sendMessage(
          conversationId: 'c1',
          authorId: 'me',
          text: 'hello',
        ),
      ).called(1);
    });

    test('trims surrounding whitespace before sending', () async {
      stubSuccess();

      await usecase(
        const SendMessageParams(
          conversationId: 'c1',
          authorId: 'me',
          text: '   hello   ',
        ),
      );

      verify(
        () => repository.sendMessage(
          conversationId: 'c1',
          authorId: 'me',
          text: 'hello',
        ),
      ).called(1);
    });

    test('rejects a blank message without touching the repository', () async {
      final Either<Failure, Message> result = await usecase(
        const SendMessageParams(
          conversationId: 'c1',
          authorId: 'me',
          text: '   ',
        ),
      );

      expect(
        result,
        const Left<Failure, Message>(
          ServerFailure('Message cannot be empty.', code: 'empty_message'),
        ),
      );
      verifyZeroInteractions(repository);
    });

    test('rejects a message longer than the maximum', () async {
      final Either<Failure, Message> result = await usecase(
        SendMessageParams(
          conversationId: 'c1',
          authorId: 'me',
          text: 'a' * (SendMessage.maxLength + 1),
        ),
      );

      expect(
        result.getLeft().toNullable(),
        const ServerFailure('Message is too long.', code: 'message_too_long'),
      );
      verifyZeroInteractions(repository);
    });
  });
}
