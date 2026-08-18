# callkit_example

Chat and calling app built on TDD Clean Architecture, feature-first, with
`go_router`, `bloc`, `freezed`, `injectable` and Firebase.

## Architecture

Dependencies point inwards. The domain layer knows nothing about Flutter,
Firebase or JSON.

```
presentation ──▶ domain ◀── data
```

| Layer | Owns | May depend on |
| --- | --- | --- |
| `domain` | entities, repository *contracts*, use cases | nothing (pure Dart) |
| `data` | DTOs (freezed + json), data sources, repository *implementations* | domain, core |
| `presentation` | BLoCs, pages, widgets | domain, core |

```
lib/
├── main.dart                     # entry point only
├── bootstrap.dart                # startup: Firebase, DI, runApp
├── app/                          # composition root
│   ├── app.dart                  # MaterialApp.router
│   ├── di/
│   │   ├── injector.dart         # @InjectableInit entry point
│   │   ├── injector.config.dart  # generated container
│   │   └── firebase_module.dart  # @module for the Firebase SDK singletons
│   ├── router/                   # go_router routes + paths
│   └── theme/                    # colours, spacing, type, ThemeData
├── core/                         # cross-feature, feature-agnostic
│   ├── config/env.dart           # injectable environment names
│   ├── error/                    # exceptions, failures, guards
│   ├── l10n/                     # ARB files + generated AppL10n
│   ├── session/                  # SessionUser + SessionProvider
│   ├── usecase/                  # UseCase / StreamUseCase contracts
│   ├── utils/                    # formatters, typedefs, bloc observer
│   └── widgets/                  # avatar, loading / message views
└── features/
    ├── chat/
    │   ├── domain/{entities,repositories,usecases}
    │   ├── data/{models,datasources,repositories}
    │   └── presentation/{bloc,pages,widgets}
    └── call/
        ├── domain/{entities,repositories,usecases}
        ├── data/{models,datasources,repositories}
        └── presentation/{bloc,pages,widgets}
```

`test/` mirrors `lib/` one-for-one, plus `test/app/app_flow_test.dart`, which
drives the real router and DI graph end to end.

## Code generation

`freezed` for every value type — entities, DTOs, use-case params and BLoC
events/states — and `injectable` for the container. Nothing is hand-written
that a generator can own.

```bash
dart run build_runner build --delete-conflicting-outputs   # one-off
dart run build_runner watch  --delete-conflicting-outputs  # while developing
```

DTOs carry `fromDoc` / `toDoc` for the Firestore document shape and an explicit
`toEntity()` hop, so a backend change is absorbed in the data layer instead of
leaking upwards. Timestamps use `EpochMillisConverter`; unknown enum values
decode to a documented default rather than throwing.

BLoC states expose named transitions (`loading()`, `loaded(...)`, `failed(...)`,
`sending()`) instead of a `copyWith` with clear-this / clear-that flags, because
freezed's `copyWith` cannot set a field back to `null`.

## Dependency injection

The graph is declared by annotations next to the classes:

- `@LazySingleton(as: Contract)` on repositories and data sources
- `@lazySingleton` on use cases
- `@injectable` on BLoCs, with `@factoryParam` for the screen's subject id
  (`sl<ChatBloc>(param1: conversationId)`)
- `@Environment(Env.firebase)` / `@Environment(Env.demo)` to pick the transport
- `@disposeMethod` on the in-memory sources, so the container releases their
  stream controllers and timers on `resetDependencies()`

`bootstrap.dart` picks the environment once, from whether the Firebase SDK
started, and everything else follows from the generated container.

## Error handling

Exceptions never cross a layer boundary.

1. A data source throws a typed `AppException`.
2. `guardFuture` / `guardStream` (`core/error/result_guard.dart`) catch it in
   the repository and translate it into a `Failure`.
3. Everything above the repository sees `Either<Failure, T>` — one code path
   for success, one for failure, no `try`/`catch` in a BLoC.

Stream failures are emitted as a `Left` *value* rather than an error event, so
a bad snapshot never kills the subscription.

## State management

- One immutable freezed state class per BLoC (`status` enum + payload + failure);
  events are freezed sealed unions, so `on<CallAnswered>` still binds to a type.
- `bloc_concurrency` transformers: `restartable()` for subscriptions,
  `droppable()` for terminal call actions, `sequential()` for sends.
- `emit.forEach` ties every stream subscription to the handler's lifetime —
  no manual `StreamSubscription`, no leaks.
- `BlocSelector` / `buildWhen` keep rebuilds scoped; the call timer ticks in a
  leaf widget so a running call does not rebuild the screen every second.

## Running without Firebase

`Firebase.initializeApp()` is attempted at startup. If no platform
configuration is present, the app logs it and falls back to in-memory data
sources, so the UI is fully runnable and seeded with demo conversations and a
ringing demo call. `AppEnvironment.usesFirebase` records which mode is active
and `injector.dart` picks the data sources accordingly.

```bash
flutter pub get
flutter run
```

In debug builds the inbox app bar has a phone icon that opens the
incoming-call screen (in production that screen is reached from a push).

## Firebase

The project is already configured against `callkitexample-707b3`
(`lib/firebase_options.dart`, `android/app/google-services.json`,
`ios/Runner/GoogleService-Info.plist`). `bootstrap.dart` starts Firebase with
`DefaultFirebaseOptions.currentPlatform`; if that fails the app falls back to
demo mode as described above.

Re-run `flutterfire configure` to point it at a different project.

Firestore layout the data sources expect:

```
conversations/{conversationId}          { participantIds, peerName, lastMessagePreview, lastMessageAt, unreadCount, isPeerOnline }
conversations/{conversationId}/messages/{messageId}  { conversationId, authorId, text, sentAt, status }
calls/{callId}                          { participantIds, callerId, peerName, direction, media, status, createdAt, connectedAt, isMicrophoneEnabled, ... }
```

Timestamps are stored as epoch milliseconds; `Timestamp` values coming back
from Firestore are normalised in the data source, which keeps the models
testable without a Firebase dependency.

### Not wired up yet

- **Push-delivered incoming calls.** The `/call/:callId/incoming` route is
  ready; delivering the call id needs `firebase_messaging` (deliberately not a
  dependency yet — it would have been dead code) plus CallKit / ConnectionService
  on the native side.
- **Authentication.** `bootstrap.dart` reads `FirebaseAuth.instance.currentUser`
  and falls back to a demo identity via `SessionProvider`. There is no sign-in flow.
- **Media.** There is no WebRTC engine; `CallVideoStage` renders placeholder
  surfaces where the remote and local renderers go.

## Localisation

Strings live in `lib/core/l10n/arb/` (`en`, `uz`) and are generated into
`lib/core/l10n/generated/` by `flutter gen-l10n` (run automatically on build via
`generate: true`). No user-facing string is hardcoded in a widget.

## Tests

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

Covered: use-case validation rules, repository exception-to-failure mapping,
BLoC transitions (`bloc_test`), presentational widgets including layout at
360 dp / textScale 1.3, and the end-to-end navigation flow.
# call-kit
