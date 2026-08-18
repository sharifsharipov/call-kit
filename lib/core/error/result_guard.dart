import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../utils/typedefs.dart';
import 'exceptions.dart';
import 'failures.dart';

/// Translates a data-layer [AppException] into its domain [Failure].
Failure failureFrom(Object error) => switch (error) {
  NetworkException(:final String message) => NetworkFailure(message),
  PermissionException(:final String message, :final String? code) =>
    PermissionFailure(message, code: code),
  NotFoundException(:final String message, :final String? code) =>
    NotFoundFailure(message, code: code),
  CacheException(:final String message, :final String? code) => CacheFailure(
    message,
    code: code,
  ),
  ServerException(:final String message, :final String? code) => ServerFailure(
    message,
    code: code,
  ),
  _ => const UnexpectedFailure(),
};

ResultFuture<T> guardFuture<T>(Future<T> Function() action) async {
  try {
    return Right<Failure, T>(await action());
  } catch (error) {
    return Left<Failure, T>(failureFrom(error));
  }
}

ResultStream<T> guardStream<T>(Stream<T> Function() action) {
  StreamSubscription<T>? subscription;
  late final StreamController<Either<Failure, T>> controller;

  controller = StreamController<Either<Failure, T>>(
    onListen: () {
      try {
        subscription = action().listen(
          (T data) => controller.add(Right<Failure, T>(data)),
          onError: (Object error, StackTrace _) =>
              controller.add(Left<Failure, T>(failureFrom(error))),
          onDone: controller.close,
        );
      } catch (error) {
        controller
          ..add(Left<Failure, T>(failureFrom(error)))
          ..close();
      }
    },
    onPause: () => subscription?.pause(),
    onResume: () => subscription?.resume(),
    onCancel: () async => subscription?.cancel(),
  );

  return controller.stream;
}
