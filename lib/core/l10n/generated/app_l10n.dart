import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_en.dart';
import 'app_l10n_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n)!;
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uz'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CallKit'**
  String get appTitle;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionRetry;

  /// No description provided for @actionSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get actionSend;

  /// No description provided for @errorGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGenericTitle;

  /// No description provided for @conversationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get conversationsTitle;

  /// No description provided for @conversationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get conversationsEmptyTitle;

  /// No description provided for @conversationsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Start a chat and it will show up here.'**
  String get conversationsEmptyMessage;

  /// No description provided for @conversationsUnreadCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{} one{{count}} other{{count}}}'**
  String conversationsUnreadCount(int count);

  /// No description provided for @chatEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get chatEmptyTitle;

  /// No description provided for @chatEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Say hello to start the conversation.'**
  String get chatEmptyMessage;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get chatInputHint;

  /// No description provided for @chatSendFailed.
  ///
  /// In en, this message translates to:
  /// **'Message could not be sent.'**
  String get chatSendFailed;

  /// No description provided for @chatPresenceOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get chatPresenceOnline;

  /// No description provided for @chatPresenceOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get chatPresenceOffline;

  /// No description provided for @chatStartAudioCall.
  ///
  /// In en, this message translates to:
  /// **'Start audio call'**
  String get chatStartAudioCall;

  /// No description provided for @chatStartVideoCall.
  ///
  /// In en, this message translates to:
  /// **'Start video call'**
  String get chatStartVideoCall;

  /// No description provided for @dayToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dayToday;

  /// No description provided for @dayYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get dayYesterday;

  /// No description provided for @callIncomingAudio.
  ///
  /// In en, this message translates to:
  /// **'Incoming call'**
  String get callIncomingAudio;

  /// No description provided for @callIncomingVideo.
  ///
  /// In en, this message translates to:
  /// **'Incoming video call'**
  String get callIncomingVideo;

  /// No description provided for @callOutgoingRinging.
  ///
  /// In en, this message translates to:
  /// **'Ringing…'**
  String get callOutgoingRinging;

  /// No description provided for @callConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get callConnecting;

  /// No description provided for @callEnded.
  ///
  /// In en, this message translates to:
  /// **'Call ended'**
  String get callEnded;

  /// No description provided for @callDeclined.
  ///
  /// In en, this message translates to:
  /// **'Call declined'**
  String get callDeclined;

  /// No description provided for @callFailed.
  ///
  /// In en, this message translates to:
  /// **'Call failed'**
  String get callFailed;

  /// No description provided for @callCameraOff.
  ///
  /// In en, this message translates to:
  /// **'Camera is off'**
  String get callCameraOff;

  /// No description provided for @callActionAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get callActionAccept;

  /// No description provided for @callActionDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get callActionDecline;

  /// No description provided for @callActionEnd.
  ///
  /// In en, this message translates to:
  /// **'End call'**
  String get callActionEnd;

  /// No description provided for @callActionMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get callActionMute;

  /// No description provided for @callActionUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get callActionUnmute;

  /// No description provided for @callActionSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get callActionSpeaker;

  /// No description provided for @callActionCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get callActionCamera;

  /// No description provided for @callActionSwitchCamera.
  ///
  /// In en, this message translates to:
  /// **'Switch camera'**
  String get callActionSwitchCamera;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppL10nEn();
    case 'uz':
      return AppL10nUz();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
