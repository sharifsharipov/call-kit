// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/session/session_provider.dart' as _i8;
import '../../features/call/data/datasources/call_remote_data_source.dart'
    as _i368;
import '../../features/call/data/datasources/firestore_call_remote_data_source.dart'
    as _i137;
import '../../features/call/data/datasources/in_memory_call_remote_data_source.dart'
    as _i611;
import '../../features/call/data/repositories/call_repository_impl.dart'
    as _i98;
import '../../features/call/domain/repositories/call_repository.dart' as _i948;
import '../../features/call/domain/usecases/accept_call.dart' as _i927;
import '../../features/call/domain/usecases/decline_call.dart' as _i1027;
import '../../features/call/domain/usecases/end_call.dart' as _i234;
import '../../features/call/domain/usecases/start_call.dart' as _i455;
import '../../features/call/domain/usecases/update_call_media.dart' as _i53;
import '../../features/call/domain/usecases/watch_call.dart' as _i303;
import '../../features/call/presentation/bloc/call_bloc.dart' as _i394;
import '../../features/call/presentation/bloc/call_launcher_cubit.dart'
    as _i272;
import '../../features/chat/data/datasources/chat_remote_data_source.dart'
    as _i980;
import '../../features/chat/data/datasources/firestore_chat_remote_data_source.dart'
    as _i1056;
import '../../features/chat/data/datasources/in_memory_chat_remote_data_source.dart'
    as _i547;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i504;
import '../../features/chat/domain/repositories/chat_repository.dart' as _i420;
import '../../features/chat/domain/usecases/send_message.dart' as _i76;
import '../../features/chat/domain/usecases/watch_conversations.dart' as _i954;
import '../../features/chat/domain/usecases/watch_messages.dart' as _i929;
import '../../features/chat/presentation/bloc/chat/chat_bloc.dart' as _i439;
import '../../features/chat/presentation/bloc/conversations/conversations_bloc.dart'
    as _i266;
import 'firebase_module.dart' as _i616;

const String _firebase = 'firebase';
const String _demo = 'demo';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firestore,
      registerFor: {_firebase},
    );
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseModule.auth,
      registerFor: {_firebase},
    );
    gh.lazySingleton<_i980.ChatRemoteDataSource>(
      () => _i547.InMemoryChatRemoteDataSource(),
      registerFor: {_demo},
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i368.CallRemoteDataSource>(
      () => _i611.InMemoryCallRemoteDataSource(),
      registerFor: {_demo},
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i8.SessionProvider>(
      () => const _i8.DemoSessionProvider(),
      registerFor: {_demo},
    );
    gh.lazySingleton<_i980.ChatRemoteDataSource>(
      () => _i1056.FirestoreChatRemoteDataSource(gh<_i974.FirebaseFirestore>()),
      registerFor: {_firebase},
    );
    gh.lazySingleton<_i8.SessionProvider>(
      () => _i8.FirebaseSessionProvider(gh<_i59.FirebaseAuth>()),
      registerFor: {_firebase},
    );
    gh.lazySingleton<_i420.ChatRepository>(
      () => _i504.ChatRepositoryImpl(gh<_i980.ChatRemoteDataSource>()),
    );
    gh.lazySingleton<_i368.CallRemoteDataSource>(
      () => _i137.FirestoreCallRemoteDataSource(
        gh<_i974.FirebaseFirestore>(),
        gh<_i8.SessionProvider>(),
      ),
      registerFor: {_firebase},
    );
    gh.lazySingleton<_i76.SendMessage>(
      () => _i76.SendMessage(gh<_i420.ChatRepository>()),
    );
    gh.lazySingleton<_i954.WatchConversations>(
      () => _i954.WatchConversations(gh<_i420.ChatRepository>()),
    );
    gh.lazySingleton<_i929.WatchMessages>(
      () => _i929.WatchMessages(gh<_i420.ChatRepository>()),
    );
    gh.factoryParam<_i439.ChatBloc, String, dynamic>(
      (conversationId, _) => _i439.ChatBloc(
        conversationId,
        gh<_i8.SessionProvider>(),
        gh<_i929.WatchMessages>(),
        gh<_i76.SendMessage>(),
      ),
    );
    gh.lazySingleton<_i948.CallRepository>(
      () => _i98.CallRepositoryImpl(gh<_i368.CallRemoteDataSource>()),
    );
    gh.factory<_i266.ConversationsBloc>(
      () => _i266.ConversationsBloc(gh<_i954.WatchConversations>()),
    );
    gh.lazySingleton<_i927.AcceptCall>(
      () => _i927.AcceptCall(gh<_i948.CallRepository>()),
    );
    gh.lazySingleton<_i1027.DeclineCall>(
      () => _i1027.DeclineCall(gh<_i948.CallRepository>()),
    );
    gh.lazySingleton<_i234.EndCall>(
      () => _i234.EndCall(gh<_i948.CallRepository>()),
    );
    gh.lazySingleton<_i455.StartCall>(
      () => _i455.StartCall(gh<_i948.CallRepository>()),
    );
    gh.lazySingleton<_i53.UpdateCallMedia>(
      () => _i53.UpdateCallMedia(gh<_i948.CallRepository>()),
    );
    gh.lazySingleton<_i303.WatchCall>(
      () => _i303.WatchCall(gh<_i948.CallRepository>()),
    );
    gh.factory<_i272.CallLauncherCubit>(
      () => _i272.CallLauncherCubit(gh<_i455.StartCall>()),
    );
    gh.factoryParam<_i394.CallBloc, String, dynamic>(
      (callId, _) => _i394.CallBloc(
        callId,
        gh<_i303.WatchCall>(),
        gh<_i927.AcceptCall>(),
        gh<_i1027.DeclineCall>(),
        gh<_i234.EndCall>(),
        gh<_i53.UpdateCallMedia>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}
