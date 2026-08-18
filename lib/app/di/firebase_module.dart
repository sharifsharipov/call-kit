import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/env.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  @Environment(Env.firebase)
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  @Environment(Env.firebase)
  FirebaseAuth get auth => FirebaseAuth.instance;
}
