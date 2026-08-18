import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/conversation.dart';
import '../repositories/chat_repository.dart';

part 'watch_conversations.freezed.dart';

@freezed
abstract class WatchConversationsParams with _$WatchConversationsParams {
  const factory WatchConversationsParams({required String userId}) =
      _WatchConversationsParams;
}

/// Streams the signed-in user's inbox, newest activity first.
@lazySingleton
class WatchConversations
    implements StreamUseCase<List<Conversation>, WatchConversationsParams> {
  const WatchConversations(this._repository);

  final ChatRepository _repository;

  @override
  ResultStream<List<Conversation>> call(WatchConversationsParams params) =>
      _repository.watchConversations(userId: params.userId);
}
