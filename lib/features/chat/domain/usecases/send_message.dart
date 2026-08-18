import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

part 'send_message.freezed.dart';

@freezed
abstract class SendMessageParams with _$SendMessageParams {
  const factory SendMessageParams({
    required String conversationId,
    required String authorId,
    required String text,
  }) = _SendMessageParams;
}

/// Sends a message after enforcing the one invariant the business cares about:
/// a message must carry non-blank text.
///
/// Validating here — not in the widget — means every caller (UI, notification
/// quick-reply, tests) gets the same rule for free.
@lazySingleton
class SendMessage implements UseCase<Message, SendMessageParams> {
  const SendMessage(this._repository);

  static const int maxLength = 4000;

  final ChatRepository _repository;

  @override
  ResultFuture<Message> call(SendMessageParams params) async {
    final String text = params.text.trim();
    if (text.isEmpty) {
      return const Left<Failure, Message>(
        ServerFailure('Message cannot be empty.', code: 'empty_message'),
      );
    }
    if (text.length > maxLength) {
      return const Left<Failure, Message>(
        ServerFailure('Message is too long.', code: 'message_too_long'),
      );
    }
    return _repository.sendMessage(
      conversationId: params.conversationId,
      authorId: params.authorId,
      text: text,
    );
  }
}
