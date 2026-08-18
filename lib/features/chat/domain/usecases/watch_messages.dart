import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

part 'watch_messages.freezed.dart';

@freezed
abstract class WatchMessagesParams with _$WatchMessagesParams {
  const factory WatchMessagesParams({required String conversationId}) =
      _WatchMessagesParams;
}

/// Streams a conversation's messages in chronological order.
@lazySingleton
class WatchMessages
    implements StreamUseCase<List<Message>, WatchMessagesParams> {
  const WatchMessages(this._repository);

  final ChatRepository _repository;

  @override
  ResultStream<List<Message>> call(WatchMessagesParams params) =>
      _repository.watchMessages(conversationId: params.conversationId);
}
