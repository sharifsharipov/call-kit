sealed class AppException implements Exception {
  const AppException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => '$runtimeType(code: $code, message: $message)';
}

final class ServerException extends AppException {
  const ServerException(super.message, {super.code});
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection.']);
}

final class PermissionException extends AppException {
  const PermissionException(super.message, {super.code});
}

final class NotFoundException extends AppException {
  const NotFoundException(super.message, {super.code});
}

final class CacheException extends AppException {
  const CacheException(super.message, {super.code});
}
