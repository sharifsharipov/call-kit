import 'package:firebase_core/firebase_core.dart';

import 'exceptions.dart';

AppException mapFirebaseException(FirebaseException error) =>
    switch (error.code) {
      'permission-denied' || 'unauthenticated' => PermissionException(
        error.message ?? 'You do not have access to this resource.',
        code: error.code,
      ),
      'unavailable' ||
      'deadline-exceeded' ||
      'network-request-failed' => const NetworkException(),
      'not-found' => NotFoundException(
        error.message ?? 'Resource not found.',
        code: error.code,
      ),
      _ => ServerException(
        error.message ?? 'Request failed.',
        code: error.code,
      ),
    };
