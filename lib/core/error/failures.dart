import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure(this.message, {this.code});

  final String message;
  final String? code;

  @override
  List<Object?> get props => <Object?>[message, code];
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

final class PermissionFailure extends Failure {
  const PermissionFailure(super.message, {super.code});
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, {super.code});
}

final class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Something went wrong.']);
}
