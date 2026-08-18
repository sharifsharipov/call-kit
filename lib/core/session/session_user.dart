import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_user.freezed.dart';

@freezed
abstract class SessionUser with _$SessionUser {
  const factory SessionUser({required String id, required String displayName}) =
      _SessionUser;
  static const SessionUser demo = SessionUser(id: 'me', displayName: 'You');
}
