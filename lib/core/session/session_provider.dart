import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../config/env.dart';
import 'session_user.dart';

abstract interface class SessionProvider {
  SessionUser get current;
}

@LazySingleton(as: SessionProvider)
@Environment(Env.firebase)
class FirebaseSessionProvider implements SessionProvider {
  const FirebaseSessionProvider(this._auth);

  final FirebaseAuth _auth;

  @override
  SessionUser get current {
    final User? user = _auth.currentUser;
    if (user == null) {
      // No sign-in flow yet; the demo identity keeps the app usable rather
      // than crashing on a null uid.
      return SessionUser.demo;
    }
    return SessionUser(id: user.uid, displayName: user.displayName ?? '');
  }
}

@LazySingleton(as: SessionProvider)
@Environment(Env.demo)
class DemoSessionProvider implements SessionProvider {
  const DemoSessionProvider();

  @override
  SessionUser get current => SessionUser.demo;
}
