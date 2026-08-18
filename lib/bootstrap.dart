import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/injector.dart';
import 'app/router/app_router.dart';
import 'core/config/env.dart';
import 'core/session/session_provider.dart';
import 'core/session/session_user.dart';
import 'core/utils/app_bloc_observer.dart';
import 'firebase_options.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  final bool firebaseReady = await _initialiseFirebase();

  configureDependencies(environment: firebaseReady ? Env.firebase : Env.demo);

  final SessionUser user = sl<SessionProvider>().current;

  runApp(CallKitApp(router: AppRouter.create(user: user)));
}

Future<bool> _initialiseFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return true;
  } catch (error, stackTrace) {
    debugPrint('Firebase unavailable, starting in demo mode: $error');
    if (kDebugMode) {
      debugPrintStack(stackTrace: stackTrace);
    }
    return false;
  }
}
