import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/epoch_millis_converter.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/message.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

/// Wire representation of a [Message].
///
/// A separate type from the entity, not a subclass: the DTO is free to change
/// with the backend, and the explicit [toEntity] hop is where that change is
/// absorbed instead of leaking upwards.
@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String conversationId,
    required String authorId,
    required String text,
    @EpochMillisConverter() required DateTime sentAt,
    // An enum case written by a newer client must degrade, not crash decoding.
    @JsonKey(unknownEnumValue: MessageStatus.sent)
    @Default(MessageStatus.sent)
    MessageStatus status,
  }) = _MessageModel;

  const MessageModel._();

  factory MessageModel.fromJson(DataMap json) => _$MessageModelFromJson(json);

  /// Firestore keeps the identifier outside the document body.
  factory MessageModel.fromDoc(String id, DataMap data) =>
      MessageModel.fromJson(<String, dynamic>{...data, 'id': id});

  factory MessageModel.fromEntity(Message entity) => MessageModel(
    id: entity.id,
    conversationId: entity.conversationId,
    authorId: entity.authorId,
    text: entity.text,
    sentAt: entity.sentAt,
    status: entity.status,
  );

  Message toEntity() => Message(
    id: id,
    conversationId: conversationId,
    authorId: authorId,
    text: text,
    sentAt: sentAt,
    status: status,
  );

  /// Document body as Firestore stores it — without the identifier, which is
  /// the document key.
  DataMap toDoc() => toJson()..remove('id');
}
