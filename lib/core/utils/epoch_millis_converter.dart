import 'package:freezed_annotation/freezed_annotation.dart';

class EpochMillisConverter implements JsonConverter<DateTime, int> {
  const EpochMillisConverter();

  @override
  DateTime fromJson(int json) =>
      DateTime.fromMillisecondsSinceEpoch(json, isUtc: true).toLocal();

  @override
  int toJson(DateTime object) => object.toUtc().millisecondsSinceEpoch;
}

class NullableEpochMillisConverter implements JsonConverter<DateTime?, int?> {
  const NullableEpochMillisConverter();

  @override
  DateTime? fromJson(int? json) => json == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(json, isUtc: true).toLocal();

  @override
  int? toJson(DateTime? object) => object?.toUtc().millisecondsSinceEpoch;
}
